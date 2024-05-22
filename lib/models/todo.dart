class Todo {
  String id;
  String title;
  String description;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
