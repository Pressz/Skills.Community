import 'package:http/http.dart' as http;

class Data {
  Future get() async{

    var url = "http://skills.community/ajax/rss";

    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {

      return response.body;
    }
  }
}