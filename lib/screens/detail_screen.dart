import 'package:flutter/material.dart';
import 'package:test_app/provider/stock.dart';
import 'package:test_app/widget/detail_screen_item.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock'),
      ),
      body: FutureBuilder<Map>(
          future: Provider.of<Stock>(context).byId(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                final data = snapshot.data as Map;
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailScreenItem(
                          title: 'Market Cap',
                          value: data['marketCap'].toString(),
                        ),
                        DetailScreenItem(
                          title: 'Divident Yield',
                          value: data['dividendYeild'].toString(),
                        ),
                        DetailScreenItem(
                            title: 'Debt To Equity',
                            value: data['debtToEquity'].toString()),
                        DetailScreenItem(
                            title: 'Current Market Price ',
                            value: data['currentMarketPrice'].toString()),
                        DetailScreenItem(
                            title: 'ROCE', value: data['roce'].toString()),
                        DetailScreenItem(
                            title: 'EPS', value: data['eps'].toString()),
                        DetailScreenItem(
                            title: 'Stcok P/E',
                            value: data['stockPe'].toString()),
                        DetailScreenItem(
                            title: 'ROE',
                            value: data['roeProviouse'].toString()),
                        DetailScreenItem(
                            title: 'Reserves',
                            value: data['reserves'].toString()),
                        DetailScreenItem(
                            title: 'Debt', value: data['debt'].toString())
                      ],
                    ),
                  ),
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          }),
    );
  }
}
