import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/add_todo_viewmodel.dart';
import '../viewmodels/todo_list_viewmodel.dart';

class AddTodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTodoViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AddTodoViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: viewModel.setTitle,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: viewModel.setDescription,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final newTodo = viewModel.createTodo();
                      Provider.of<TodoListViewModel>(context, listen: false).addTodo(newTodo);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add Todo'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
