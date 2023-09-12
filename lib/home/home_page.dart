// ignore_for_file: prefer_is_empty
import 'package:flutter/material.dart';
import 'package:movie_app/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await controller.getMovies();
                setState(() {});
              },
              child: const Text('PUXA TUDO DA API')),
          controller.movie?.results?.length == 0
              ? Container()
              : Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.movie?.results?.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              Divider(),
                              Container(
                                height: 200,
                                width: 200,
                                decoration:
                                    BoxDecoration(color: Colors.green.shade200),
                                child: Column(
                                  children: [
                                    Flexible(
                                        child: Image.network(
                                      'https://image.tmdb.org/t/p/original/${controller.movie!.results?[index].posterPath ?? ''}',
                                      fit: BoxFit.contain,
                                    )),
                                    Text(
                                        'Avaliação: ${controller.movie!.results?[index].voteAverage}'),
                                    Text(
                                      controller.movie!.results?[index].title ??
                                          '',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                )
        ],
      ),
    );
  }
}
