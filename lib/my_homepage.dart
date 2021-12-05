import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services/auth.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const MyHomePage({Key? key, required this.auth, required this.firestore})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Flutter"),
        actions: [
          IconButton(
              onPressed: () {
                Auth(auth: widget.auth).signout();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
