import 'package:flutter/cupertino.dart';
import 'package:mytodoapp/model/todo.dart';

class Todosprovider extends ChangeNotifier {
  //per pacchetto providerdevi estendere da changenotifier
  List<Todo> todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'ciao',
      isdone: false,
      description: 'sono il primo todo',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Dare sciroppo a Mela 🐾 🍎',
      isdone: false,
      description: 'bau bau',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Comprare cibo  😋',
      isdone: false,
      description: 'gnam,gnam',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Giocare all'XBOX🎮",
      isdone: false,
      description: '',
    ),
  ];

  List<Todo> get alltodosnotdone => todos
      .where((todo) =>
          todo.isdone ==
          false) //mi serve per mostrare poi todo fatti in una sezione e gli altri nella prima sezione
      .toList();

  List<Todo> get todoscompleted =>
      todos.where((todo) => todo.isdone == true).toList();

  void createtodo(Todo nuovo) {
    todos.add(nuovo);
    notifyListeners();
  }

  void removetodo(Todo eliminare) {
    todos.remove(eliminare);
    notifyListeners();
  }

  bool toggletodostatus(Todo todo) {
    todo.isdone = !todo.isdone;
    notifyListeners();
    return todo.isdone;
  }

  void updatetodo(Todo todo, title, description) {
    todo.description = description;
    todo.title = title;
    notifyListeners();
  }
}
