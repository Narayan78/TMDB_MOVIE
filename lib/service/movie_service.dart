
import 'package:dio/dio.dart';

import 'package:riverspods/constants/common.dart';
import 'package:riverspods/models/movie.dart';
import 'package:riverspods/models/video.dart';





class MovieService {

static final dio = Dio();

 static Future<List<Movie>> getPopularMovieData({required String apiPath}) async{
      try{
        final response = await dio.get(apiPath,
         options: Options(
            headers: credential
         )
        );

        return  (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();

      }on DioException catch (err){
         throw '${err.response}';
      }
  }


static Future<List<Video>> getMovieVideo({required int id}) async{
  try{
    final response = await dio.get('https://api.themoviedb.org/3/movie/$id/videos',
        options: Options(
            headers: credential
        )
    );

    return  (response.data['results'] as List).map((e) => Video.fromJson(e)).toList();

  }on DioException catch (err){
    throw '${err.response}';
  }
}



}