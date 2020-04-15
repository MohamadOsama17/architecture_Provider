import 'package:architecture_provider/ui/screens/favorite/favorite.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 50, top: 20),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 35,
              ),
            ),
            _buildItem(
              myWidget: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text('My Favorite Posts'),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FavoriteScreen(),),);
                },
              ),
            ),
            _buildItem(
              myWidget: ListTile(
                leading: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.green.shade700,
                ),
                title: Text('Users'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({Widget myWidget}) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: myWidget,
    );
  }
}
