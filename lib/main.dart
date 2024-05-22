import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/todo_list_viewmodel.dart';
import 'views/todo_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListViewModel()),
      ],
      child: MaterialApp(
        title: 'Todo List MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListView(),
      ),
    );
  }
}
