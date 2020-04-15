import '../logic/view_models/comment_model.dart';
import '../logic/view_models/favorite_model.dart';
import '../logic/view_models/posts_model.dart';
import 'package:get_it/get_it.dart';
import './models/post.dart';
import './services/api.dart';

GetIt sl = GetIt.instance;

setUp() {
  sl.registerLazySingleton(() => Post());
  sl.registerLazySingleton(() => Api());
  sl.registerLazySingleton(() => PostModel());
  sl.registerLazySingleton(() => FavoriteModel());
  sl.registerLazySingleton(() => CommentModel());
}
