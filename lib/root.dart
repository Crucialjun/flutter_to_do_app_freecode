import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app_freecode/my_homepage.dart';
import 'package:flutter_to_do_app_freecode/services/auth.dart';
import 'package:flutter_to_do_app_freecode/widgets/login.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootState();
  }
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            return Login(auth: _auth, firestore: _firestore);
          } else {
            return MyHomePage(auth: _auth, firestore: _firestore);
          }
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        }
      },
    );
  }
}
