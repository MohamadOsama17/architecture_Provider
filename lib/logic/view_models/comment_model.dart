import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/models/comment.dart';
import 'package:flutter/foundation.dart';
import '../services/api.dart';
import '../enums.dart';

class CommentModel extends ChangeNotifier {
  ViewState _state = ViewState.loaded;

  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  var _api = sl<Api>();

  List<Comment> _comments = [];

  get comments => _comments;

  Future<List<Comment>> fetchComments(int postId) async {
    setState(ViewState.loading);
    _comments = await _api.getCommentPost(postId);
    print('${_comments.length}' + '  from Comment Model');
    setState(ViewState.loaded);
    return _comments;
  }
}
