import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverspods/constants/api.dart';
import 'package:riverspods/service/movie_service.dart';







final moviePopular = FutureProvider((ref) => MovieService.getPopularMovieData(apiPath: Api.popularMovie));
final topRated = FutureProvider((ref) => MovieService.getPopularMovieData(apiPath: Api.topRatedMovie));
final upComing = FutureProvider((ref) => MovieService.getPopularMovieData(apiPath: Api.upcomingMovie));
final videoProvider = FutureProvider.family((ref, int id) => MovieService.getMovieVideo(id: id));
