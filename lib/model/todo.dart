import 'dart:convert';
import 'dart:math';

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String id = getuniqueid();
  bool isdone; //se completato o no. in base a ciò sarà in un tab diverso

  Todo(
      {required this.createdTime,
      required this.title,
      this.description = '',
      this.isdone = false});
}

String getuniqueid() {
  final numbers = List<int>.generate(
      32, (index) => Random.secure().nextInt(100),
      growable: true);
  return base64Encode(numbers).toString();
}
