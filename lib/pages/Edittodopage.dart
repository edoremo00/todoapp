import 'package:flutter/material.dart';
import 'package:mytodoapp/model/todo.dart';
import 'package:mytodoapp/provider/todos.dart';
import 'package:mytodoapp/utils/snackbar.dart';
import 'package:mytodoapp/widgets/todoformwidget.dart';
import 'package:provider/provider.dart';

class Edittodowidget extends StatefulWidget {
  final Todo todo;
  const Edittodowidget({Key? key, required this.todo}) : super(key: key);

  @override
  _EdittodowidgetState createState() => _EdittodowidgetState();
}

class _EdittodowidgetState extends State<Edittodowidget> {
  late String title;
  late String description;
  late GlobalKey<FormState> _formkey;
  @override
  void initState() {
    super.initState();
    description = widget.todo.description;
    title = widget.todo.title;
    _formkey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: Text(
            'modifica todo',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(28),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Todoformwidget(
              description: description,
              title: title,
              onChangeddescription: (description) =>
                  setState(() => this.description = description),
              onChangedtitle: (title) => setState(() => this.title = title),
              onSavedtodo: saveupdatedtodo,
            ),
          ),
        ),
      );

  void saveupdatedtodo() async {
    bool isformvalid = _formkey.currentState!.validate();
    bool iskeyboardopen = MediaQuery.of(context).viewInsets.bottom != 0;

    if (isformvalid) {
      final provider = Provider.of<Todosprovider>(context, listen: false);
      provider.updatetodo(widget.todo, title, description);
      Utils.showsnackbar(context, 'Modificato con successo');
      await Future.delayed(
        Duration(seconds: 3),
      ).whenComplete(
        () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      );
      iskeyboardopen
          ? Navigator.of(context).pop()
          : Navigator.of(context).pop();
    }
    return;
  }
}
