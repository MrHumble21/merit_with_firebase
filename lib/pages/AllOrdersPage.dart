import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllOrdersPage extends StatefulWidget {
  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  late var _auth;
  String? currentUser;
  @override
  void initState() {
    // TODO: implement initState

    _auth = FirebaseAuth.instance;
    getCurrentUser();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DataRow> rows = [];
          // print(snapshot.data!.docs.where((doc) => doc['order_taken_by'] == currentUser));
          for (var doc in snapshot.data!.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            if(data['order_taken_by']==currentUser){
              Object? docRef = doc.data();
              // String docId = docRef?.id; // Get the generated ID

              print(docRef);
              String name = data['order_name'];
              String amount = data['order_amount'];
              String deadline = data['order_deadline'];
              String clientPhone = data['order_owner'].toString().split('-')[0];
              String orderedBy = data['order_owner'].toString().split('-')[1];
              String clientRegion = data['order_owner'].toString().split('-')[2];
              var isDelivered = data['is_delivered'];
              // print(data['order_owner'].toString().split('-'));
              rows.add(DataRow(cells: [
                DataCell(Text(name)),
                DataCell(Text(amount)),
                DataCell(Text(deadline)),
                DataCell(Text(orderedBy)),
                DataCell(Text(clientPhone)),
                DataCell(Text(clientRegion)),
                DataCell(
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent,),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('orders')
                            .doc(doc.id)
                            .delete();
                      },
                    ),
                  ),
                ),
                DataCell(
                isDelivered?
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.done, color: Colors.blueAccent,),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('orders')
                            .doc(doc.id)
                            .update({'is_delivered': false});
                      },
                    ),
                  ):Center(
                    child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.blueAccent),
                 onPressed: () async {
                   FirebaseFirestore.instance
                       .collection('orders')
                       .doc(doc.id)
                       .update({'is_delivered': true});

            },
          ),
                  ),
                ),
              ],),);
            }

          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Deadline')),
                  DataColumn(label: Text('Client Phone')),
                  DataColumn(label: Text('Ordered by')),
                  DataColumn(label: Text('Client Region')),
                  DataColumn(label: Text('Delete Order')),
                  DataColumn(label: Text('Delivered')),
                ],
                rows: rows,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),

    );
  }
  getCurrentUser() {
    User? user = _auth.currentUser;
    if (user != null) {
      String email = user.email!;
      String displayName = user.displayName ?? '';
      setState(() {
        currentUser = displayName;
      });
      print('User email: $email');
      print('User display name: $displayName');
    } else {
      print('No user signed in');
    }

  }

   updateDocument(id, status) {
     // Get a reference to the document to be updated
     DocumentReference documentReference = FirebaseFirestore.instance.collection('orders').doc(id);
     // Update the data in the document
     documentReference.update({
       'isDelivered': !status,
     }).then((value) {
       print('Document updated successfully');
     }).catchError((error) {
       print('Failed to update document: $error');
     });
   }
}
