import 'package:http/http.dart';
import 'package:scorch/Constants/AppConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountService {
  static Future makePostLogin(String username, String password) async {
    String url = '${AppConfig.Url}/token';
    Map<String, String> headers = {};
    Map<String, String> body = {
      "grant_type": "password",
      "username": username,
      "password": password
    };
    // make POST request
    return await post(url, headers: headers, body: body);
  }

  static checkIfAuthenticated() async {
    String url = '${AppConfig.Url}/api/Account/CheckIfAuthenticated';
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, String> headers = {
      'Authorization':'bearer $token'
    };
    Response res = await get('$url', headers: headers);
    return res.statusCode == 200;
  }
}