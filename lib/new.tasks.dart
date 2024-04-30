import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewTasksPage extends StatelessWidget {
  final txtName = TextEditingController();

  void _onSaved(BuildContext context) {
    FirebaseFirestore.instance.collection('tasks').add(
      {
        'name': txtName.text,
        'finished': false,
        'uid':FirebaseAuth.instance.currentUser!.uid,
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Tasks"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: txtName,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Save"),
                  onPressed: () => _onSaved(context),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
