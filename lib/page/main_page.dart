import 'package:flutter/material.dart';
import 'package:todo_app/component/todo_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _newToDoController = TextEditingController();
  List todoList = ["Finish learning Flutter"];

  void addItem() {
    setState(() {
      todoList.add(_newToDoController.text);
      _newToDoController.clear();
    });
  }

  void removeItem(int index) {
    todoList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To do list")),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return TodoItem(
            name: todoList[index],
            onDelete: (context) => removeItem(index),
          );
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: addItem,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
