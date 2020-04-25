import 'package:http/http.dart';
import 'package:scorch/Constants/AppConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  final String url = '${AppConfig.Url}/api/app';
  Future scorch(String body) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, String> headers = {
      "content-type": "application/json",
      'Authorization':'bearer $token'
    };
    // make POST request
    return await post('$url/scorch', headers: headers, body: body);
  }
}