import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CreateClient extends StatefulWidget {
  const CreateClient({Key? key}) : super(key: key);

  @override
  _CreateClientState createState() => _CreateClientState();
}

class _CreateClientState extends State<CreateClient> {
  final _clientNameController = TextEditingController();
  final _clientPhoneController = TextEditingController();
  var _auth;
  String? clientCreatedBy;
  late var db;
  var isVisible = false;
  Map<String, String>? _selectedRegion;
  final List<Map<String, String>> _regions = [
    {'name': 'Andijan', 'id': '1'},
    {'name': 'Bukhara', 'id': '2'},
    {'name': 'Fergana', 'id': '3'},
    {'name': 'Jizzakh', 'id': '4'},
    {'name': 'Karakalpakstan', 'id': '5'},
    {'name': 'Namangan', 'id': '6'},
    {'name': 'Navoiy', 'id': '7'},
    {'name': 'Qashqadaryo', 'id': '8'},
    {'name': 'Samarqand', 'id': '9'},
    {'name': 'Sirdaryo', 'id': '10'},
    {'name': 'Surxondaryo', 'id': '11'},
    {'name': 'Tashkent', 'id': '12'},
    {'name': 'Tashkent Region', 'id': '13'},
    {'name': 'Xorazm', 'id': '14'},
  ];

  Future<void> delayedFunction(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    Navigator.pushNamed(context, '/all-clients');
  }


  @override
  void initState() {
    // TODO: implement initState
    _auth = FirebaseAuth.instance;
    getCurrentUser();
    db = FirebaseFirestore.instance;
    super.initState();
  }
  @override
  void dispose() {
    _clientNameController.dispose();
    _clientPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Client'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, child: Icon(Icons.home, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text("Create Client", style: TextStyle(color: Colors.blue, fontSize: 25),),),
            isVisible ?
              Center(child: Lottie.asset('./lib/assets/add.json', width: 200, animate: true)): Container(),
              const SizedBox(height: 16.0),
              TextField(
                controller: _clientNameController,
                decoration: const InputDecoration(
                  labelText: 'Client Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _clientPhoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Client Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<Map<String, String>>(
                value: _selectedRegion,
                items: _regions.map((region) {
                  return DropdownMenuItem(
                    value: region,
                    child: Text(region['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRegion = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Client Region',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  createClient();                  // TODO: Implement create client logic
                },
                child: const Text('Create Client'),
              ),
            ],
          ),
        ),
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

   createClient() {
     // Create a new user with a first and last name
     final client = <String, dynamic>{
       "client_name": _clientNameController.text,
       "client_created_by": clientCreatedBy,
       "client_phone": _clientPhoneController.text,
       "client_region": _selectedRegion,

     };

// Add a new document with a generated ID
     db.collection("clients").add(client).then((DocumentReference doc){
       print('DocumentSnapshot added with ID: ${doc.id}');
       setState(() {
         isVisible = true;
       });
       delayedFunction(3000);
     });

   }
  getCurrentUser() {
    User? user = _auth.currentUser;
    if (user != null) {
      // String email = user.email!;
      String displayName = user.displayName ?? '';
      setState(() {
        clientCreatedBy = displayName;
      });

    } else {
      print('No user signed in');
    }

  }

}
