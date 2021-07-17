import 'package:flutter/widgets.dart';
import 'package:test_app/api/api.dart';
import 'package:test_app/model/search_result.dart';

class Stock with ChangeNotifier {
  late Map<String, dynamic> stock;

  //login cal to api
  Future<bool> login(String uname, String pass) {
    var response = StockApi().login(uname, pass);
    return response;
  }

  //Search request to api
  Future<List<SearchResult>> suggestions(String query) async {
    List<SearchResult> result = [];
    final res = await StockApi().searchStock(query);
    res.data.forEach((e) => result.add(SearchResult(id: e.id, title: e.name)));
    return result;
  }

  //Detail request to api by Id
  Future<Map<String, dynamic>> byId(String id) async {
    final res = await StockApi().idStock(id);
    stock = {
      'id': res['data']['id'],
      'name': res['data']['name'],
      'createdAt': res['data']['createdAt'],
      'currentMarketPrice': res['data']['current_market_price'],
      'debt': res['data']['debt'],
      'debtToEquity': res['data']['debt_to_equity'],
      'dividendYeild': res['data']['dividend_yeild'],
      'eps': res['data']['eps'],
      'marketCap': res['data']['market_cap'],
      'reserves': res['data']['reserves'],
      'roce': res['data']['roce'],
      'roeProviouse': res['data']['roe_proviouse'],
      'stockPe': res['data']['stock_pe'],
      'updatedAt': res['data']['updatedAt'],
    };
    return stock;
  }
}
