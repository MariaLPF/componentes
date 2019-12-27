import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          /*Container(
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            margin: EdgeInsets.only(right: 20.0),
          )*/
          Container(
            margin: EdgeInsets.only(right: 5.0),
            padding: EdgeInsets.all(5.0),
            
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              radius: 25.0,
              backgroundImage: NetworkImage('http://3.bp.blogspot.com/-IZwdbBB_Ht8/UtnlNhYNhHI/AAAAAAAAKpc/HQsZUTcnnEo/s1600/h_kitty_016_o.png') ,
            ),
            
          ),
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.greenAccent
            ),
          )

        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('http://3.bp.blogspot.com/-1Xjqe8kbNJ8/TlTbPrjZntI/AAAAAAAAAI4/yFeIEAf6nKg/s1600/superkitty_by_4unt3r-d36jbu7.jpg'),
          placeholder: AssetImage('asset/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
