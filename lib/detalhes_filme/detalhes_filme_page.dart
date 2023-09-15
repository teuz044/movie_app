import 'package:flutter/material.dart';

import '../home/controllers/home_controller.dart';

class DetalhesFilmePage extends StatefulWidget {
  const DetalhesFilmePage({super.key});

  @override
  State<DetalhesFilmePage> createState() => _DetalhesFilmePageState();
}

class _DetalhesFilmePageState extends State<DetalhesFilmePage> {
  HomeController controller = HomeController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white54),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white54),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.white54,
            ),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}
