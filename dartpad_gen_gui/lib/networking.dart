import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

class Network {
  final String data;

  Network({this.data});

  Future compile() async {
    http.Response response = await http.post(
      jsonEncode([{
        "url" : "https://api.jdoodle.com/v1/execute",
        "Content-Type" : "application/json",
        "clientId": "$kClientID",
        "clientSecret": "$kClientSecret",
        "script": "void main() { print('Hi'); }",
        "language": "dart",
        "versionIndex": "3",
          }])
    );
    print(response.statusCode);
    return jsonDecode(response.body);
  }
}
