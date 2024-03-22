import 'package:flutter/material.dart';
import 'package:quiz1/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //
        // ),

        body: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String username = '';
  String password = '';

  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Page',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ]
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoginSuccess ? Colors.blue : Colors.red,
        ),
        onPressed: () {
          if (emailPattern.hasMatch(username) && password.length >= 8) {
            // Username is a valid email and password meets the minimum length requirement
            if ((username == "user@gmail.com") &&
                password == "user1234") {
              setState(() {
                isLoginSuccess = true;
              });
              // Replace the current page with the home page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              setState(() {
                isLoginSuccess = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invalid username or password')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid email or password format')),
            );
          }
        },
        child: const Text('Login', style: TextStyle(color: Colors.white),),
      ),
    );
  }
  }