import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app_freecode/services/auth.dart';

class Login extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Login({Key? key, required this.auth, required this.firestore})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: email_controller,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: password_controller,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          SizedBox(
            width: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final String retVal = await Auth(auth: widget.auth).signin(
                        email: email_controller.text,
                        password: password_controller.text);
                    if (retVal == "Success") {
                      email_controller.clear();
                      password_controller.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: Text("Sign In")),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final String retVal = await Auth(auth: widget.auth)
                        .createAccount(
                            email: email_controller.text,
                            password: password_controller.text);
                    if (retVal == "Success") {
                      email_controller.clear();
                      password_controller.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: Text("Create Account")),
            ],
          ),
        ],
      ),
    );
  }
}
