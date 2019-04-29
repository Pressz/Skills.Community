import 'package:app/access/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:app/models/anyitem.dart';
import 'package:app/models/post.dart';
import 'package:app/models/menuitem.dart';
import 'package:app/screens/behaviour.dart';

class Home extends StatelessWidget {
  final List<ListItem> items;
  Home({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'SKILLS COMMUNITY';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: Image.asset(item.authorimage)),
                  Expanded(flex: 6, child: Text(item.sender)),
                ],
              ),
              subtitle: Column(
                children: <Widget>[Image.network(item.image), Text(item.title)],
              ),
              onTap: () {
                final snackBar = SnackBar(content: Text("Tap"));
                Scaffold.of(context).showSnackBar(snackBar);
                launch(item.link);
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int value) {
          if (value == 1)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BehaviourRoute()),
            );
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('مهارت بیاموزم'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_alarm),
            title: new Text('چه کردم؟'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('من کیستم؟'))
        ],
      ),
    );
  }
}
