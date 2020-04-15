import 'package:architecture_provider/logic/enums.dart';
import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/services/api.dart';
import 'package:architecture_provider/logic/view_models/favorite_model.dart';
import 'package:architecture_provider/logic/view_models/posts_model.dart';
import 'package:architecture_provider/ui/screens/details_post/postDetails.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import './w_drawer.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var service = sl<PostModel>();
  var fav = sl<FavoriteModel>();
  @override
  void initState() {
    super.initState();
    print("init");

    // to get the post from api
    service.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostModel>(
      create: (context) => service,
      child: SafeArea(
        child: Scaffold(
          drawer: HomeDrawer(),
          backgroundColor: Theme.of(context).primaryColorLight,
          appBar: AppBar(
            title: Text('Posts'),
            bottomOpacity: 10,
          ),
          // body: Consumer<PostModel>(
          //   builder: (context, model, child) {
          //     return ListView.builder(
          //       itemCount: Post.posts.length,
          //       itemBuilder: (context, index) {
          //         return PostCard(
          //           post: Post.posts[index],
          //           onTap: () {},
          //         );
          //       },
          //     );
          //   },
          // ),
          body: Consumer<PostModel>(
            builder: (context, model, child) {
              return model.state == ViewState.loading
                  ? LoadingIndecator()
                  : ListView.builder(
                      itemCount: model.posts.length,
                      itemBuilder: (context, int index) {
                        return PostCard(
                          post: model.posts[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetails(
                                  post: model.posts[index],
                                ),
                              ),
                            );
                            // print(model.posts[index].postId);
                          },
                        );
                      },
                    );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () async {
              Api api = Api();
              await api.getCommentPost(20);
            },
            child: Icon(Icons.title),
          ),
        ),
      ),
    );
  }
}
