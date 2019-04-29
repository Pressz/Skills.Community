
import 'package:app/models/anyitem.dart';
import 'package:xml/xml.dart';

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String link;
  final String title;
  final String image;
  final String authorimage;

  MessageItem(this.sender, this.link, this.title, this.image, this.authorimage);

  factory MessageItem.fromXml(XmlElement xmlItem) {



    return MessageItem(
      xmlItem.children[7].text,
      xmlItem.children[3].text,
      xmlItem.children[1].text,
      (xmlItem.children[11] as XmlElement).getAttribute("url"),
      'images/user6.jpg' as String,
    );
  }

  factory MessageItem.fromJson(Map<String, dynamic> json) {
    return MessageItem(
      json['author'] as String,
      json['link'] as String,
      json['title'] as String,
      'http://skills.community/download.php?id=24441e8d-a9b2-485b-b061-6cfebe5fe094' as String,
      'images/user6.jpg' as String,
    );
  }
}