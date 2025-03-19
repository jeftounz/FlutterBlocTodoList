class Task {
  final int id; // Cambiar de String a int
  final String title;
  final String description;
  final int categoryId; // Cambiar de String a int
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    this.isCompleted = false,
  });

  // Método para convertir un Map en un objeto Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      categoryId: map['categoryId'],
      isCompleted: map['isCompleted'] == 1, // Convertir de int a bool
    );
  }

  // Método para convertir un objeto Task en un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'isCompleted': isCompleted ? 1 : 0, // Convertir de bool a int
    };
  }
}
