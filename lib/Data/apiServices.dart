import 'dart:convert';

import 'package:mvvmproject/Data/Network/baseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmproject/Data/Network/appExceptions.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
          'Error while Communication ${response.statusCode}',
        );
    }
  }

  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    } on Exception {
      throw InternetException('No Internet');
    }
    return jsonData;
  }
}
