import 'package:flutter/material.dart';
import 'package:midterm2/data/dataBaseHelper.dart';
import 'package:midterm2/screens/home_screen.dart';
final _formKey = GlobalKey<FormState>();
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  child: TextFormField(
                    controller: _loginController,
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                  child: TextButton(
                    onPressed: ()=> Navigator.pushNamed(context, HomeScreen.routeName).then((_) {
                      Database.userID =_loginController.text;
                      print("user Saved");
                    }),
                  child: Text("Login")
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
