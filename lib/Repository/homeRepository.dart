import 'package:mvvmproject/Data/apiServices.dart';
import 'package:mvvmproject/Resources/AppUrl/AppUrl.dart';

class HomeRepository {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}
