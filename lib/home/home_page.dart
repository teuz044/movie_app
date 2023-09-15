// ignore_for_file: prefer_is_empty
import 'package:flutter/material.dart';
import 'package:movie_app/home/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    controller.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathFlix',
            style: GoogleFonts.montserrat(color: Colors.white60, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          controller.movie?.results?.length == 0
              ? Container()
              : Flexible(
                  child: FutureBuilder(
                      future: controller.getMovies(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const CircularProgressIndicator();
                          default:
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('Erro ao carregar'),
                              );
                            } else {
                              return ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16, top: 16),
                                    child: Text(
                                        'Filmes mais bem avaliados - 8.0 +',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                      height: 3,
                                      decoration: const BoxDecoration(
                                          color: Colors.white38)),
                                  CarouselSlider.builder(
                                      options: CarouselOptions(
                                        autoPlay: false,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.4,
                                        aspectRatio: 2.0,
                                        initialPage: 1,
                                      ),
                                      itemCount: controller
                                          .lstResultsFilterVoteRage8.length,
                                      itemBuilder: (BuildContext context,
                                              int index, int pageViewIndex) =>
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Flexible(
                                                child: Container(
                                                  height: 250,
                                                  width: 250,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Colors.black54),
                                                  child: Column(
                                                    children: [
                                                      Flexible(
                                                          child: Image.network(
                                                        'https://image.tmdb.org/t/p/original/${controller.lstResultsFilterVoteRage8[index].posterPath ?? ''}',
                                                        fit: BoxFit.contain,
                                                      )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Text(
                                                          'Avaliação: ${controller.lstResultsFilterVoteRage8[index].voteAverage}',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  color: Colors
                                                                      .white54),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Text(
                                                            controller
                                                                    .lstResultsFilterVoteRage8[
                                                                        index]
                                                                    .title ??
                                                                '',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),

                                  // CAROUSEL 2

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16, top: 16),
                                    child: Text('Todos os filmes',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                      height: 3,
                                      decoration: const BoxDecoration(
                                          color: Colors.white38)),
                                  CarouselSlider.builder(
                                      options: CarouselOptions(
                                        autoPlay: false,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.4,
                                        aspectRatio: 2.0,
                                        initialPage: 1,
                                      ),
                                      itemCount: controller.lstResults.length,
                                      itemBuilder: (BuildContext context,
                                              int index, int pageViewIndex) =>
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Flexible(
                                                child: Container(
                                                  height: 250,
                                                  width: 250,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Colors.black54),
                                                  child: Column(
                                                    children: [
                                                      Flexible(
                                                          child: Image.network(
                                                        'https://image.tmdb.org/t/p/original/${controller.lstResults[index].posterPath ?? ''}',
                                                        fit: BoxFit.contain,
                                                      )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Text(
                                                          'Avaliação: ${controller.lstResults[index].voteAverage}',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  color: Colors
                                                                      .white54),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Text(
                                                            controller
                                                                    .lstResults[
                                                                        index]
                                                                    .title ??
                                                                '',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    color: Colors.white)),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                ],
                              );
                            }
                        }
                      }),
                )
        ],
      ),
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
            icon: Icon(Icons.school, color: Colors.white54,),
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
