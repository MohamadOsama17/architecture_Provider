import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/models/post.dart';
import 'package:architecture_provider/logic/services/api.dart';
import 'package:flutter/material.dart';
import '../enums.dart';

class PostModel extends ChangeNotifier {
  ViewState _state = ViewState.loaded;
  var _service = sl<Api>();
  get state => _state;

  List<Post> posts = [];
  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Post>> getPosts() async {
    setState(ViewState.loading);
    posts = await _service.getPosts();
    setState(ViewState.loaded);
    return posts;
  }

}
