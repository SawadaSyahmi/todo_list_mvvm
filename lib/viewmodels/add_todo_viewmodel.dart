import 'package:flutter/material.dart';
import '../models/todo.dart';

class AddTodoViewModel extends ChangeNotifier {
  String _title = '';
  String _description = '';

  String get title => _title;
  String get description => _description;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setDescription(String description) {
    _description = description;
    notifyListeners();
  }

  Todo createTodo() {
    return Todo(
      id: DateTime.now().toString(),
      title: _title,
      description: _description,
    );
  }
}
