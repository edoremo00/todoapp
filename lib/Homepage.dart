import 'package:flutter/material.dart';
import 'package:mytodoapp/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [Container(), Container()];
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
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
