import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.name,
    required this.onDelete,
    required this.isDone,
    required this.toggleIsDone,
  });

  final String name;
  final Function onDelete;
  // Move state to parent widget
  final bool isDone;
  final Function toggleIsDone;

  void toggleItem() {
    toggleIsDone();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          Checkbox(value: isDone, onChanged: (value) => toggleItem()),
          TextButton(onPressed: () => onDelete(), child: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
