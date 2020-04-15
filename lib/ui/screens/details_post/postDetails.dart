import 'package:architecture_provider/logic/enums.dart';
import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/models/post.dart';
import 'package:architecture_provider/ui/shared/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/view_models/comment_model.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  PostDetails({@required this.post});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  void initState() {
    super.initState();
    sl<CommentModel>().fetchComments(widget.post.postId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<CommentModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.post.title),
        ),
        body: Column(
          children: <Widget>[
            PostCard(
              post: widget.post,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<CommentModel>(
                builder: (context, model, child) {
                  return model.state == ViewState.loading
                      ? LoadingIndecator()
                      : ListView.builder(
                          itemCount: model.comments.length,
                          itemBuilder: (context, index) {
                            return CommentCard(
                              comment: model.comments[index],
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
