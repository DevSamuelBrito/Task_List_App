import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  void _signIn(BuildContext context) async {
    // usa o async para esperar 1 ele tentar e depois logar

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );
      Navigator.pushReplacementNamed(context, '/tasks');
    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados invalidos'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: Container(
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Login",
                ),
              ),
              TextField(
                controller: txtPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                obscureText: true,
              ),
              ElevatedButton(
                child: Text("Sign In"),
                onPressed: () => _signIn(context),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text("New User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
