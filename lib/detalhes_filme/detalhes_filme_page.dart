import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/controllers/home_controller.dart';

class DetalhesFilmePage extends StatefulWidget {
  const DetalhesFilmePage({super.key, required this.controller});
  final HomeController controller;

  @override
  State<DetalhesFilmePage> createState() => _DetalhesFilmePageState();
}

class _DetalhesFilmePageState extends State<DetalhesFilmePage> {
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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text('MathFlix',
            style: GoogleFonts.montserrat(
                color: Colors.white60, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Container(
            width: 350,
            height: 350,
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.black87),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${widget.controller.posterPathEC.text}',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Avaliação: ${widget.controller.voteAverageEC.text}',
                      style: GoogleFonts.montserrat(color: Colors.white60),
                    ), 
                    SizedBox(width: 8,),
                    widget.controller.estrelasAvaliacao(),
                  ],
                ),
                 const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
               widget.controller.originalTitleEC.text,
              style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.controller.overviewEC.text, style: GoogleFonts.montserrat(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Language: ', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                Text(widget.controller.linguagemFilme(widget.controller.originalLanguageEC.text), style: GoogleFonts.montserrat(color: Colors.white),),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
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
