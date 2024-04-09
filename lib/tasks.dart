import 'dart:js';

import 'package:flutter/material.dart';
import 'package:task_list/app.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
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
    );
  }
}
