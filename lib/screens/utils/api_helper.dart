import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vasundhra_3/screens/apicall/model/api_model.dart';

class ApiHelper {
  static final ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<NewsModel> getApi() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-08-02&sortBy=publishedAt&apiKey=b080f300e173423aa5819f8c3e3e2114"));

    var json = jsonDecode(response.body);

    NewsModel n1 = NewsModel.fromJson(json);
    return n1;
  }
}
