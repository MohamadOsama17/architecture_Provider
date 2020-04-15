import 'package:architecture_provider/logic/models/post.dart';
import 'package:flutter/foundation.dart';

class FavoriteModel extends ChangeNotifier {
  List<Post> favoritePosts = [];
//Post post;

  // ViewState _state = ViewState.loaded;

  // setState(ViewState state) {
  //   _state = state;
  //   notifyListeners();
  // }

  addToList(Post post) {
    favoritePosts.add(post);
    notifyListeners();
  }

  remove(Post post) {
    favoritePosts.remove(post);
    notifyListeners();
  }

  removeFromList(int index) {
    favoritePosts.removeAt(index);
    notifyListeners();
  }
}
