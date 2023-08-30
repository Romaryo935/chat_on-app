import 'package:chat_on/chat_screen.dart';

import 'package:chat_on/shared/snackbar.dart';
import 'package:chat_on/welcompage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (snapshot.hasError) {
          return showSnackBar(context, "Something went wrong");
        } else if (snapshot.hasData) {
          return     const ChatScreen();
   

        } else {
          return const Welcompage();
        }
      },
    ),
  ));
}

