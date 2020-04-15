import 'package:architecture_provider/logic/locator.dart';
import 'package:architecture_provider/logic/view_models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
 // var ser = sl<FavoriteModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteModel>.value(
      value:  sl<FavoriteModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 15,
              ),
              Text('My Favorite'),
            ],
          ),
        ),
        // body: Center(
        //   child: ser.favoritePosts.length == 0
        //       ? Text('data')
        //       : ListView.builder(
        //           itemCount: ser.favoritePosts.length,
        //           itemBuilder: (context, int index) {
        //             return ListTile(
        //               title: Text(ser.favoritePosts[index].toString()),
        //               onTap: () {
        //                 ser.removeFromList(index);
        //                 setState(() {});
        //               },
        //             );
        //           },
        //         ),
        // ),
        body: Consumer<FavoriteModel>(
          builder: (context, model, child) {
            return model.favoritePosts.length == 0
                ? Center(
                    child: Text('Ther is No Favorite Posts Yet'),
                  )
                : ListView.builder(
                    itemCount: model.favoritePosts.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text(model.favoritePosts[index].title.toString()),
                        onTap: () {
                          model.removeFromList(index);
                        },
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
