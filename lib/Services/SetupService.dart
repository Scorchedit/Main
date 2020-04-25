import 'package:http/http.dart';
import 'package:scorch/Constants/AppConfig.dart';
import 'package:scorch/searchSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupService {
  static getSearchSettings() async {
    String url = '${AppConfig.Url}/api/Setup/GetSearchSettings';
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, String> headers = {
      'Authorization':'bearer $token'
    };
    var response = await get('$url', headers: headers);
    return response.body;
  }

  static Future setSearchSetting(SearchOptionsModel obj) async {
    String url = '${AppConfig.Url}/api/Setup/SetSearchSetting';
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, String> body = {
      "Key": obj.Key,
      "Value": obj.Value.toString(),
      "Type": obj.Type.toString()
    };
    Map<String, String> headers = {
      'Authorization':'bearer $token'
    };
    return await put(url, headers: headers, body: body);
  }

  static Future setSearchDistanceSetting(double value) async {
    String url = '${AppConfig.Url}/api/Setup/SetSearchDistanceSetting?value=$value';
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Map<String, String> headers = {
      'Authorization':'bearer $token'
    };
    return await put(url, headers: headers, body: {});
  }
}