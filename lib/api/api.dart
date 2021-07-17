import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/model/StockModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockApi {
  String? _token;

  //getter for token
  Future<String> get token async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return '';
    }
    final extractedUserData = prefs.getString('userData');
    return extractedUserData.toString();
  }

  //Searching stock by name
  Future<StockModel> searchStock(String query) async {
    var url = Uri.parse('http://test.kaimly.com/api/stocks/search?name=$query');
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer ${await token}'});
    return StockModel.fromJson(json.decode(response.body));
  }

  //Stock by Id
  Future<Map<String, dynamic>> idStock(String id) async {
    var url = Uri.parse('http://test.kaimly.com/api/stocks/$id');
    final response = await http
        .get(url, headers: {"Authorization": "Bearer ${await token}"});
    final responeData = json.decode(response.body);
    return responeData;
  }

  //Login
  Future<bool> login(String uname, String pass) async {
    var url = Uri.parse('http://test.kaimly.com/api/signin');
    final response = await http.post(
      url,
      body: json.encode(
        {"username": "$uname", "password": "$pass"},
      ),
      headers: {"Content-Type": "application/json"},
    );
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      _token = responseData['token'];
      final prefs = await SharedPreferences.getInstance();
      final userData = responseData['token'];
      prefs.setString('userData', userData);
      return true;
    }

    return false;
  }
}
