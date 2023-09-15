import 'package:movie_app/home/models/movies_model.dart';
import 'package:movie_app/home/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository = HomeRepository();

  MoviesModel? movie;
  var lstResults = <Results>[];
  var lstResultsFilterVoteRage8 = <Results>[];

  Future<void> getMovies() async {
    movie = await _homeRepository.getMovies();
    lstResults = movie!.results!;
    lstResultsFilterVoteRage8 = lstResults.where((element) => element.voteAverage! >= 8.0).toList();
    print(lstResults);
  }
}
