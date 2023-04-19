import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();

}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _password;
  late String _phone;
  late var db;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void updateDisplayName(String displayName) async {
    try {
      User? user = _auth.currentUser;
      await user?.updateDisplayName(displayName);
      print('Display name updated successfully!');
    } catch (error) {
      print('Error updating display name: $error');
    }
  }
  void updatePhoneNumber(String phoneNumber) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // First, create a PhoneAuthCredential object
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: user.uid, // You can use the user's uid as the verification ID
          smsCode: '123456', // TODO: Replace with the actual SMS code
        );

        // Then, update the user's phone number with the credential
        await user.updatePhoneNumber(credential);

        print('Phone number updated successfully!');
      } catch (e) {
        print('Failed to update phone number: $e');
      }
    } else {
      print('No user is currently signed in.');
    }
  }
  var userStatusChecker = (){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  };


  @override
  void initState() {

    // TODO: implement initState
    userStatusChecker();
     db = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60,),
                  Center(child: Image.asset('lib/assets/merit.png', width: MediaQuery.of(context).size.width * 0.5,) ,),
                  const SizedBox(height: 30,),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: false,
                    maxLength: 15,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phone = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        // TODO: Perform registration logic
                        createUserWithEmailAndPassword();
                      }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(onTap: (){
                    Navigator.pushNamed(context, '/sign-in');
                  },child: const Text("Do you have an account | Login"),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createUserWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
        
      );
      updateDisplayName(_name);
      addUser();
      Navigator.pushNamed(context, '/sign-in');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
   addUser() {
     String? userId = _auth.currentUser?.uid;
     // Create a new user with a first and last name
    final user = <String, dynamic>{
      "user_id":userId,
      "full_name": _name,
      "phone_number": _phone
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc){
      print('DocumentSnapshot added with ID: ${doc.id}');
      Navigator.pushNamed(context, '/home');
    } );

  }
}
