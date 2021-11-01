import 'package:flutter/material.dart';
import 'package:mytodoapp/widgets/todoformwidget.dart';

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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crea todo",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Todoformwidget(
              onChangedtitle: (title) => setState(() => this.title =
                  title), //servono per avere nuovo valore titolo e descrizione ed aggiornare UI
              onChangeddescription: (description) =>
                  setState(() => this.description = description),
              onSavedtodo: () {},
            ),
          ],
        ),
      );
}
