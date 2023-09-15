import 'package:flutter/material.dart';
import 'package:movie_app/home/models/movies_model.dart';
import 'package:movie_app/home/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository = HomeRepository();

  final adultEC = TextEditingController();
  final backdropPathEC = TextEditingController();
  final genreIdsEC = TextEditingController();
  final mediaTypeEC = TextEditingController();
  final originalLanguageEC = TextEditingController();
  final originalTitleEC = TextEditingController();
  final overviewEC = TextEditingController();
  final popularityEC = TextEditingController();
  final posterPathEC = TextEditingController();
  final releaseDateEC = TextEditingController();
  final titleEC = TextEditingController();
  final videoEC = TextEditingController();
  final voteAverageEC = TextEditingController();
  final voteCountEC = TextEditingController();

  MoviesModel? movie;
  var lstResults = <Results>[];
  var lstResultsFilterVoteRage8 = <Results>[];

  Future<void> getMovies() async {
    movie = await _homeRepository.getMovies();
    lstResults = movie!.results!;
    lstResultsFilterVoteRage8 =
    lstResults.where((element) => element.voteAverage! >= 8.0).toList();
  }

  void selecionarFilmeVoteRage8(int index) {
    adultEC.text = lstResultsFilterVoteRage8[index].adult.toString();
    backdropPathEC.text = lstResultsFilterVoteRage8[index].backdropPath ?? '';
    genreIdsEC.text = lstResultsFilterVoteRage8[index].genreIds.toString();
    mediaTypeEC.text = lstResultsFilterVoteRage8[index].mediaType ?? '';
    originalLanguageEC.text = lstResultsFilterVoteRage8[index].originalLanguage ?? '';
    originalTitleEC.text = lstResultsFilterVoteRage8[index].originalTitle ?? '';
    overviewEC.text = lstResultsFilterVoteRage8[index].popularity.toString();
    posterPathEC.text = lstResultsFilterVoteRage8[index].posterPath ?? '';
    releaseDateEC.text = lstResultsFilterVoteRage8[index].title ?? '';
    videoEC.text = lstResultsFilterVoteRage8[index].video.toString();
    voteAverageEC.text = lstResultsFilterVoteRage8[index].voteAverage.toString();
    voteCountEC.text = lstResultsFilterVoteRage8[index].voteCount.toString();
    print(originalTitleEC.text);
  }
  void selecionarFilmesTodos(int index) {
    adultEC.text = lstResults[index].adult.toString();
    backdropPathEC.text = lstResults[index].backdropPath ?? '';
    genreIdsEC.text = lstResults[index].genreIds.toString();
    mediaTypeEC.text = lstResults[index].mediaType ?? '';
    originalLanguageEC.text = lstResults[index].originalLanguage ?? '';
    originalTitleEC.text = lstResults[index].originalTitle ?? '';
    overviewEC.text = lstResults[index].popularity.toString();
    posterPathEC.text = lstResults[index].posterPath ?? '';
    releaseDateEC.text = lstResults[index].title ?? '';
    videoEC.text = lstResults[index].video.toString();
    voteAverageEC.text = lstResults[index].voteAverage.toString();
    voteCountEC.text = lstResults[index].voteCount.toString();
    print(originalTitleEC.text);
  }
}
