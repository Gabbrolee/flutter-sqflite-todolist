import 'package:flutter/material.dart';
import 'package:flutter_sql_todolist/screens/home_screen.dart';

import '../models/categories.dart';
import '../services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _categoryDescriptionController = TextEditingController();

  var category = Categories();
  var categoryService = CategoryService();

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: ()=> Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  child:  const Text("Cancel" ),
              ),
              ElevatedButton(
                  onPressed: (){
                    category.name = _categoryNameController.text;
                    category.description = _categoryDescriptionController.text;
                    categoryService.saveCategory(category);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Save")
              )
            ],
            title: const Text("Categories Form"),
            content: SingleChildScrollView(
              child: Column(
                children:  [
                  TextField(
                    controller: _categoryNameController,
                    decoration: const  InputDecoration(
                        hintText: "Write a Category", labelText: 'Category'),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: const  InputDecoration(
                        hintText: "Write a Description", labelText: 'Description'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          color: Colors.blue,
        ),
        title: const Text("Categories"),
        elevation: 0.0,
      ),
      body: const Center(
        child: Text('Welcome to Categories Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
