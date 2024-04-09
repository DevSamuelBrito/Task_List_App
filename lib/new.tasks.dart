import 'package:flutter/material.dart';

class NewTasksPage extends StatelessWidget {
  const NewTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Tasks"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context,"/tasks");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
