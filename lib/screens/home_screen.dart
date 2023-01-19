import 'package:flutter/material.dart';
import 'package:flutter_sql_todolist/helpers/drawer_navigation.dart';
import 'package:flutter_sql_todolist/src/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List Sqflite"),
      ),
      drawer: const DrawerNavigation(),
    );
  }
}
