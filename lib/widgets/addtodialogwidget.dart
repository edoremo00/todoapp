import 'package:flutter/material.dart';
import 'package:mytodoapp/model/todo.dart';
import 'package:mytodoapp/provider/todos.dart';
import 'package:mytodoapp/utils/snackbar.dart';
import 'package:mytodoapp/widgets/todoformwidget.dart';
import 'package:provider/provider.dart';

class Addtododialogwidget extends StatefulWidget {
  const Addtododialogwidget({Key? key}) : super(key: key);

  @override
  _AddtododialogwidgetState createState() => _AddtododialogwidgetState();
}

class _AddtododialogwidgetState extends State<Addtododialogwidget> {
  late GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();
    _formkey = GlobalKey<FormState>();
    title = '';
    description = '';
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crea todo",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              SizedBox(
                height: 8,
              ),
              Todoformwidget(
                onChangedtitle: (title) => setState(() => this.title =
                    title), //servono per avere nuovo valore titolo e descrizione ed aggiornare UI
                onChangeddescription: (description) =>
                    setState(() => this.description = description),
                onSavedtodo: createtodo,
              ),
            ],
          ),
        ),
      );

  void createtodo() {
    bool formisvalid = _formkey.currentState!.validate();
    if (formisvalid) {
      Todo nuovo = Todo(
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );
      final provider = Provider.of<Todosprovider>(context, listen: false);
      //provider.alltodos.add(nuovo);
      //provider.notifyListeners(); NON POSSO FARE DIRETTAMENTE COSI. AGGIORNAMENTO UI CON NOT LISTENER LO PUO FARE SOLO IL MIO PROVIDER
      provider.createtodo(nuovo);
      Navigator.of(context).pop();
      //chiudi dialog
      Utils.showsnackbar(context, "creato");
    }
    return; //utente riceve messaggio errore del validator
  }
}
