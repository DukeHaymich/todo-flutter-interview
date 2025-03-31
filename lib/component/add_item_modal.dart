import 'package:flutter/material.dart';

class AddItemModal extends StatelessWidget {
  const AddItemModal({
    super.key,
    required this.controller,
    required this.onAddItem,
  });

  final TextEditingController controller;
  final Function onAddItem;

  void onSaveItem(BuildContext context) {
    onAddItem();
    Navigator.of(context).pop();
  }

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          Text("New to do:"),
          TextField(controller: controller, autofocus: true),
        ],
      ),
      actions: [
        TextButton(onPressed: () => onSaveItem(context), child: Text("Add")),
        TextButton(onPressed: () => onCancel(context), child: Text("Cancel")),
      ],
    );
  }
}
