import 'package:flutter/material.dart';
import 'package:test_app/provider/stock.dart';
import 'package:test_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController unameController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Stocks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Consumer<Stock>(
          builder: (_, st, ch) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: new InputDecoration(
                          labelText: "UserName",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        controller: unameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: new InputDecoration(
                          labelText: "Password",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        controller: passController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var response = await st.login(
                              unameController.text, passController.text);
                          if (response) {
                            Navigator.pushReplacementNamed(
                                context, SearchScreen.routeName);
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text('Error'),
                                      content: Text('Something is wrong'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('cancel'))
                                      ],
                                    ));
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          // child: ,
        ),
      ),
    );
  }
}
