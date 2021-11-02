import 'package:flutter/material.dart';

class Todoformwidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedtitle;
  final ValueChanged<String> onChangeddescription;
  final VoidCallback onSavedtodo;
  const Todoformwidget(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangeddescription,
      required this.onChangedtitle,
      required this.onSavedtodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildtitleformfield(),
            SizedBox(
              height: 8,
            ),
            builddescriptionformfield(),
            SizedBox(
              height: 32,
            ),
            buildsavebutton()
          ],
        ),
      );

  Widget buildtitleformfield() => TextFormField(
        initialValue: title,
        onChanged: onChangedtitle,
        maxLines: 1,
        autovalidateMode:
            AutovalidateMode.onUserInteraction, //servirà qunado aggiornero todo
        validator: (title) {
          if (title!.isEmpty) {
            return "titolo è obbligatorio";
          } else if (title.trim().length == 0) {
            //trim per togliere spazi e length per sapere se ci sono lettere. se ci sono length sara>=1
            return "digitare almeno un carattere";
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Titolo',
        ),
      );

  Widget builddescriptionformfield() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangeddescription,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        /*validator: (description) {
          if (description!.isEmpty) {
            return "descrizione obbligatoria";
          } else if (description.trim().length == 0) {
            return "digitare almeno un carattere";
          }
          return null;
        },*/
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Descrizione',
        ),
      );

  Widget buildsavebutton() => SizedBox(
        //wrap con sixedbox per farli occupare tutta larghezza disponibile con double.inifinity
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onSavedtodo,
          icon: Icon(Icons.save),
          label: Text("Salva"),
        ),
      );
}
