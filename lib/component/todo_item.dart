import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.name, required this.onDelete});

  final String name;
  final Function(BuildContext) onDelete;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;

  void toggleItem() {
    setState(() {
      isDone = !isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(widget.name),
          Checkbox(value: isDone, onChanged: (value) => toggleItem()),
          TextButton(
            onPressed: () => widget.onDelete(context),
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
