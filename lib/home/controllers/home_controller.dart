
import 'package:movie_app/home/models/movies_model.dart';
import 'package:movie_app/home/repositories/home_repository.dart';

 class HomeController {
   final HomeRepository _homeRepository = HomeRepository();


  MoviesModel? movie;

  Future<void> getMovies() async{
   movie = await _homeRepository.getMovies();
  
   print(movie);
  }
}