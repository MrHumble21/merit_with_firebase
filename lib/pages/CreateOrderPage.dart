import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meritwithfirebase/assets/elements.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lottie/lottie.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = elements.first['name']! + elements.first['code']!;
  late var _auth;
  var isVisible = false;


  TextEditingController _amountController = TextEditingController();
  TextEditingController _deadlineController = TextEditingController();
  TextEditingController _clientController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();

  // List<String> clients =[];
  List<Map<String, dynamic>> clients = [
  ];
  List<String> clients_phone = [
  ];
  List<Map<String, dynamic>> temp = [
  ];


  String? selectedClient;
  String? selectedPhone;
  String? selectedElement;
  String? orderTakenBy;

  var db;
  @override
  void dispose() {
    _amountController.dispose();
    _deadlineController.dispose();
    _clientController.dispose();
    super.dispose();
  }


  void fetchClients() {

    FirebaseFirestore.instance
        .collection('clients')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
          print(doc['client_phone']);
          temp.add({
            'client_phone': doc['client_phone'],
            'client_name': doc['client_name'],
            'client_region': doc['client_region']['name']
          });
      }
      // print(temp);
      setState(() {
        clients = temp;
      });
    });


  }


  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
    getCurrentUser();
    fetchClients();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Order'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isVisible ?
                Center(child: Lottie.asset('./lib/assets/add.json', width: 200, animate: true)): Container(),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Order amount',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an order amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _deadlineController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Order deadline',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an order deadline';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Client',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: clients
                        .map((item) => DropdownMenuItem<String>(
                      value: item['client_name'] +"-" + item["client_phone"]+ "-" + item["client_region"],
                      child: Text(
                       "${"Name: " +item['client_name']}\nPhone: "+ item['client_phone'] +" - Region: "+ item['client_region'],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedClient,
                    onChanged: (value) {
                      setState(() {

                        selectedClient = value as String;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
               DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Element',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: elements
                        .map((item) => DropdownMenuItem(
                      value: item['name'],
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedElement,
                    onChanged: (value) {
                      setState(() {
                        selectedElement = value as String;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Create a new user with a first and last name
                      final user = <String, dynamic>{
                        "order_deadline": _deadlineController.text,
                        "order_taken_by": orderTakenBy,
                        "order_amount": _amountController.text,
                        "order_owner": selectedClient,
                        "client_phone": selectedClient,
                        "order_name": selectedElement,
                        "is_delivered": false
                      };

// Add a new document with a generated ID
                      db.collection("orders").add(user).then((DocumentReference doc){
                        print('DocumentSnapshot added with ID: ${doc.id}');
                        setState(() {
                          isVisible = true;
                        });
                        delayedFunction(3000);

                      });
                    }
                  },
                  child: const Text('Create Order'),
                ),
              ],
            ),
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
  Future<void> delayedFunction(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    Navigator.pushNamed(context, '/all-orders');
  }

   getCurrentUser() {
     User? user = _auth.currentUser;
     if (user != null) {
       String email = user.email!;
       String displayName = user.displayName ?? '';
       setState(() {
         orderTakenBy = displayName;
       });
       print('User email: $email');
       print('User display name: $displayName');
     } else {
       print('No user signed in');
     }

     }
}
