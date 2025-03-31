import 'package:flutter/material.dart';
import 'package:todo_app/component/add_item_modal.dart';
import 'package:todo_app/component/todo_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _newToDoController = TextEditingController();
  List todoList = [];

  void addItem() {
    // Move isDone state to outer widget, as builder doesn't keep track of which isDone state belong to which todoItem
    setState(() {
      todoList.add([_newToDoController.text, false]);
      _newToDoController.clear();
    });
  }

  void removeItem(int index) {
    // Add set state for re-render
    setState(() {
      todoList.removeAt(index);
    });
  }

  // Add toggle isDone for each todo item
  void toggleIsDone(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // Add addItem dialog
  Future _showAddItemDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItemModal(controller: _newToDoController, onAddItem: addItem);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To do list")),
      body: ListView.builder(
        // Add count
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoItem(
            name: todoList[index][0],
            // Fix parameter
            isDone: todoList[index][1],
            toggleIsDone: () => toggleIsDone(index),
            onDelete: () => removeItem(index),
          );
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () => _showAddItemDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
