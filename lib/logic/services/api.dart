import 'package:architecture_provider/logic/models/post.dart';
import 'package:dio/dio.dart';
import '../models/comment.dart';

class Api {
  String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  Dio _dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return status < 500;
      },
    ),
  );

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    print('starting');
    try {
      var response = await _dio.get(_baseUrl + 'posts');
      if (response.data != null) {
        for (var item in response.data) {
          posts.add(
            Post.formJson(item),
          );
        }
      }
    } on DioError catch (e) {
      print("error");
      print(e.toString());
    }
    return posts;
  }

  Future<List<Comment>> getCommentPost(int postId) async {
    List<Comment> comments = [];
    print("starting get Comments");
    var response = await _dio.get(_baseUrl + 'posts/$postId/comments');
    if (response.data != null) {
      for (var item in response.data) {
        comments.add(Comment.fromJson(item));
      }
    }
    return comments;
  }
}
