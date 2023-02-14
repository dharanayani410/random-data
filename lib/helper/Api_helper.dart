import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modals/custom.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();
  Future<Randm?> fetchData() async {
    String api = "https://randomuser.me/api/";
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);

      Randm allData = Randm.fromJson(json: data);

      return allData;
    }
    return null;
  }
}
