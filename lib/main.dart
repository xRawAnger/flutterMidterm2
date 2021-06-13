import 'package:flutter/material.dart';
import 'package:midterm2/screens/add_new_item_screen.dart';
import 'package:midterm2/screens/home_screen.dart';
import 'package:midterm2/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AddNewItem.routeName: (ctx) => AddNewItem(),
        },
    );
  }
}
