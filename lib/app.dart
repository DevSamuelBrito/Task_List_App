import 'package:flutter/material.dart';
import 'login.page.dart';
import 'new.tasks.dart';
import 'register.page.dart';
import 'tasks.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//tirar a faixa de debug
      theme: ThemeData.light(
        useMaterial3: false,
        // primarySwatch: Colors.amber,
      ),
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/tasks": (context) => TasksPage(),
        "/newtask": (context) => NewTasksPage(),
      },
      initialRoute: '/login',
    );
  }
}