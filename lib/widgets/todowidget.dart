import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mytodoapp/model/todo.dart';
import 'package:mytodoapp/pages/Edittodopage.dart';
import 'package:mytodoapp/provider/todos.dart';
import 'package:mytodoapp/utils/snackbar.dart';
import 'package:provider/provider.dart';

class Todowidget extends StatelessWidget {
  final Todo todo;
  const Todowidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        //per dare borderradius a slidable
        borderRadius: BorderRadius.circular(20),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(
            key: Key(todo.id), //non chiaro cos'è
          ),
          actions: [
            IconSlideAction(
              icon: Icons.edit,
              caption: "Modifica",
              onTap: () => edittodo(context, todo),
              color: Colors.green,
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              caption: "Elimina",
              onTap: () => deletetodo(todo, context),
              color: Colors.red,
            ),
          ],
          child: buildtodo(context),
        ),
      );

  Widget buildtodo(BuildContext context) => GestureDetector(
        onTap: () => edittodo(context,
            todo), //per edit to do senza usare lo slide ma cliccandoci sopra direttamente
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isdone,
                onChanged: (_) {
                  final provider =
                      Provider.of<Todosprovider>(context, listen: false);
                  final isdone = provider.toggletodostatus(todo);
                  Utils.showsnackbar(
                    context,
                    isdone
                        ? "contrassegnato come completato"
                        : "contrassegnato come da fare",
                  );
                },
                //con questo sposteremo valore todo da attivo o no e viceversa
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    todo.description.isNotEmpty ||
                            todo.description.trim().length >
                                0 //in caso ho la descrizione mostro widget testo. sennò container vuoto
                        ? Text(
                            todo.description,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  deletetodo(Todo eliminare, BuildContext context) {
    final provider = Provider.of<Todosprovider>(context, listen: false);
    provider.removetodo(eliminare);
    Utils.showsnackbar(context, 'Eliminato');
  }

  edittodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Edittodowidget(todo: todo),
        ),
      );
}
