import '../../../logic/models/comment.dart';
import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/models/post.dart';
import 'package:architecture_provider/logic/view_models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function onTap;
  final Function like;

  PostCard({
    this.post,
    this.onTap,
    this.like,
  });
  final favorite = sl<FavoriteModel>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<FavoriteModel>(),
      child: Consumer<FavoriteModel>(
        builder: (context, model, child) {
          return InkWell(
            onTap: onTap,
            child: Card(
              elevation: 10,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      post.body,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: favorite.favoritePosts.contains(post)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  )
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              (favorite.favoritePosts.contains(post))
                                  ? favorite.remove(post)
                                  : favorite.addToList(post);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoadingIndecator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final Comment comment;
  CommentCard({this.comment});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      //height: 50,
      decoration: cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 5,
              left: 5,
              bottom: 20,
              right: 5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: CircleAvatar(),
                  margin: EdgeInsets.only(right: 12),
                ),
                Expanded(
                  child: Text(
                    comment.body,
                    //textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                FittedBox(
                  child: Container(
                    width: 275,
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      comment.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    comment.email,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration cardDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.grey.shade300),
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      blurRadius: 10,
      color: Colors.grey.withOpacity(0.5),
      offset: Offset(8, 8),
      spreadRadius: 2,
    )
  ],
);
