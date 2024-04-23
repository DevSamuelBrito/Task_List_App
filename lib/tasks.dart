import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_list/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void _logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${user.displayName}"),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/newtask'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore
              .collection('tasks')
              .orderBy('finished', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            var docs = snapshot.data!.docs;

            return ListView(
              children: docs
                  .map(
                    (doc) => Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      onDismissed: (_) => doc.reference.delete(),
                      key: Key(doc.id),
                      child: CheckboxListTile(
                        title: Text(doc['name']),
                        subtitle: Text("low"),
                        value: doc['finished'],
                        onChanged: (value) => doc.reference.update({'finished':value}),
                      ),
                    ),
                  )
                  .toList(),
            );
          }),
    );
  }
}
