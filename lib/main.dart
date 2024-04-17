import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAT_y0lEL5bD0w9enXruKOVv9IrbArFURs",
    authDomain: "tasklist-9f78e.firebaseapp.com",
    projectId: "tasklist-9f78e",
    storageBucket: "tasklist-9f78e.appspot.com",
    messagingSenderId: "280767043565",
    appId: "1:280767043565:web:37f1b64331b882f4f479e4");

void main() {
  WidgetsFlutterBinding.ensureInitialized();//aguardando flutter carregar para carregar o firebase
  Firebase.initializeApp(options: firebaseConfig);
  runApp(const App());
}
