import 'package:flutter/material.dart';
import 'package:mytodoapp/provider/todos.dart';
import 'package:mytodoapp/widgets/todowidget.dart';
import 'package:provider/provider.dart';

class Todolistwidget extends StatelessWidget {
  const Todolistwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<Todosprovider>(context); //per avere accesso a provider
    final alltodos =
        provider.alltodosnotdone; //per ottenere lista todo non fatti
    return alltodos.isEmpty
        ? Center(
            child: Text(
              'Nessun todo clicca + per creane uno', //nel caso in cui non ho todo
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final todo = alltodos[index];
              return Todowidget(todo: todo);
            },
            separatorBuilder: (context, index) {
              /*return Divider(
          color: Colors.grey[300],
          indent: 20,
          endIndent: 20,
          thickness: 2,
        );*/
              return SizedBox(
                height: 8,
              );
            },
            itemCount: alltodos.length,
          );
  }
}
