// To parse this JSON data, do
//
//     final StockModel = StockModelFromJson(jsonString);

import 'dart:convert';

StockModel StockModelFromJson(String str) =>
    StockModel.fromJson(json.decode(str));

String StockModelToJson(StockModel data) => json.encode(data.toJson());

class StockModel {
  StockModel({
    required this.data,
  });

  List<Datum> data;

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.name,
    required this.id,
    required this.currentMarketPrice,
    required this.marketCap,
    required this.stockPe,
    required this.dividendYeild,
    required this.roce,
    required this.roeProviouse,
    required this.debtToEquity,
    required this.eps,
    required this.reserves,
    required this.debt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  double currentMarketPrice;
  double marketCap;
  double stockPe;
  double dividendYeild;
  double roce;
  double roeProviouse;
  double debtToEquity;
  double eps;
  double reserves;
  double debt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        currentMarketPrice: json["current_market_price"].toDouble(),
        marketCap: json["market_cap"].toDouble(),
        stockPe: json["stock_pe"].toDouble(),
        dividendYeild: json["dividend_yeild"].toDouble(),
        roce: json["roce"].toDouble(),
        roeProviouse: json["roe_proviouse"].toDouble(),
        debtToEquity: json["debt_to_equity"].toDouble(),
        eps: json["eps"].toDouble(),
        reserves: json["reserves"].toDouble(),
        debt: json["debt"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "current_market_price": currentMarketPrice,
        "market_cap": marketCap,
        "stock_pe": stockPe,
        "dividend_yeild": dividendYeild,
        "roce": roce,
        "roe_proviouse": roeProviouse,
        "debt_to_equity": debtToEquity,
        "eps": eps,
        "reserves": reserves,
        "debt": debt,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
