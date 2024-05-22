import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_list_viewmodel.dart';
import 'add_todo_view.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TodoListViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.todos.length,
            itemBuilder: (context, index) {
              final todo = viewModel.todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) {
                    viewModel.toggleTodoStatus(todo.id);
                  },
                ),
                onLongPress: () {
                  viewModel.deleteTodo(todo.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTodoView(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
