import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_list/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

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
      body: ListView(
        children: [
          // ListTile(
          //   title: Text("task 1"),
          //   subtitle: Text("Tall"),
          //   trailing: Checkbox(value: false, onChanged: (_) {}),
          // ),
          Dismissible(
            background: Container(color: Colors.red,),
            onDismissed: (_){},
            key: Key(
              "Task2"
            ),
            child: CheckboxListTile(
              title: Text("task 2"),
              subtitle: Text("low"),
              value: false,
              onChanged: (_) {},
            ),
          ),
          CheckboxListTile(
            title: Text("task 3"),
            subtitle: Text("medium"),
            value: false,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
