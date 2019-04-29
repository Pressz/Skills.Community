import 'dart:convert';

import 'package:app/access/data.dart';
import 'package:app/models/anyitem.dart';
import 'package:app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xml2json/xml2json.dart';
import 'package:xml/xml.dart' as xml;

main() async {
  var body = await (new Data().get());

// json
//  Xml2Json myTransformer = Xml2Json();
//  myTransformer.parse(body);
//  var jsonResponse = json.decode(myTransformer.toParker())['rss']['channel']['item'];
//  var items = (jsonResponse as List).map((i) {
//    return MessageItem.fromJson(i);
//  }).toList();

  /*
// xml
  var storeDocument = xml.parse(body);
  //var items = storeDocument.findAllElements('item').map((each) => each.getAttribute(name)).toList();
  var wtf = storeDocument.findAllElements('item');
  var xmllist = wtf as List;
  var items = (xmllist).map((i) {
    return MessageItem.fromXml(i);
  }).toList();
*/

  List<ListItem> items = [];
  var document = xml.parse(body);
  var xmlitems = document.findAllElements('item');
//  var res = items
//      .map((item) => item.toXmlString())
//      .toList()
//      .forEach(print)
//  ;
  for (var value in xmlitems) {
    var item = MessageItem.fromXml(value);
    items.add(item);
  }

  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
//        Locale("en", "US"),
      Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    title: 'Navigation Basics',
    home: Home(
      items: items,
    ),
  ));
}
