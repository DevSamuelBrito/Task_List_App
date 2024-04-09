import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTasksPage extends StatelessWidget {
  const NewTasksPage({super.key});

  void _onSaved(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Tasks"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          child: Column(
            children: [
              TextField(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
