import 'package:flutter/material.dart';

import '../../controller/provider_todo.dart';


void showDeleteCnfrmtn(BuildContext context, TodoProvider todoProvider, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Task?'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.black)
            ),
          ),
          TextButton(
            onPressed: () {
              // Delete the task if confirmed
              todoProvider.removeTodo(index);
              Navigator.of(context).pop();
            },
            child: const Text('Delete',
                style: TextStyle(color: Colors.black)
            ),
          ),
        ],
      );
    },
  );
}

// Inside your ListTile
