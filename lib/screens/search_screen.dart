import 'package:flutter/material.dart';
import 'package:test_app/model/search_result.dart';
import 'package:test_app/provider/stock.dart';
import 'package:test_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    final FocusNode node;
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'The eisiest way to buy and sell stocks',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Stock analysis and screening tool for investors in india.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              final response =
                  await showSearch(context: context, delegate: StockSearch());
              if (response != '') {
                Navigator.of(context)
                    .pushNamed(DetailScreen.routeName, arguments: response);
              }
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Search..',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StockSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
              showSuggestions(context);
            }
          },
          icon: Icon(Icons.clear),
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
          child: Column(children: [
        Icon(Icons.home),
        Text('hello'),
      ]));

  @override
  Widget buildSuggestions(BuildContext context) =>
      FutureBuilder<List<SearchResult>>(
        future: Provider.of<Stock>(context).suggestions(query),
        builder: (context, snapshot) {
          if (query.isEmpty) {
            return buildNoSuggestions();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError || snapshot.data == null) {
                print('nodata');
                return buildNoSuggestions();
              }
              return buildSuggestionsSucess(snapshot.data!);
          }
        },
      );
  Widget buildNoSuggestions() => Center(
        child: Text('Type Something'),
      );

  Widget buildSuggestionsSucess(List<SearchResult> suggestions) =>
      ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index].title),
              onTap: () {
                close(context, suggestions[index].id.toString());
              },
            );
          });
}
