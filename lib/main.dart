import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meritwithfirebase/pages/AllClientsPage.dart';
import 'package:meritwithfirebase/pages/AllOrdersPage.dart';
import 'package:meritwithfirebase/pages/CreateClient.dart';
import 'package:meritwithfirebase/pages/CreateOrderPage.dart';
import 'package:meritwithfirebase/pages/DashboardPage.dart';
import 'package:meritwithfirebase/pages/PhoneNumberAddAndConfirm.dart';
import 'package:meritwithfirebase/pages/RegistrationPage.dart';
import 'package:meritwithfirebase/pages/SignInPage.dart';
import 'package:meritwithfirebase/pages/HomePage.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Navigation Demo',
      initialRoute: '/sign-in',
      routes: {
        '/': (context) => MyHomePage(),
        '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => RegistrationPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/create-client': (context) => const CreateClient(),
        '/create-order': (context) => const CreateOrderPage(),
        '/all-clients': (context) => ClientsPage(),
        '/all-orders': (context) => AllOrdersPage(),
        '/home':(context) => MyHomePage(),
      },
    );
  }
}




