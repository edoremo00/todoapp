import 'package:flutter/material.dart';
import 'package:mytodoapp/widgets/addtodialogwidget.dart';
import 'package:mytodoapp/main.dart';
import 'package:mytodoapp/widgets/completedtodowidget.dart';
import 'package:mytodoapp/widgets/todolistwidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [Todolistwidget(), Completedtodowidget()];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Text(
          MyApp.title,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(28),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          enableFeedback: true,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: selectedindex,
          onTap: (index) => setState(() {
            selectedindex = index;
          }),
          items: [
            BottomNavigationBarItem(
              tooltip: 'Da fare',
              icon: Icon(Icons.fact_check_outlined),
              label: 'Da fare',
            ),
            BottomNavigationBarItem(
              tooltip: 'Completati',
              icon: Icon(Icons.done),
              label: 'Completati',
            ),
          ],
        ),
      ),
      body: tabs[selectedindex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Addtododialogwidget();
          },
        ),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        tooltip: 'create new todo',
      ),
    );
  }
}
