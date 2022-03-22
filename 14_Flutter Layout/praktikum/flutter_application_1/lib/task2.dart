import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('GridView'),
          ),
          body: Container(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    child: Icon(Icons.search),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    child: Icon(Icons.access_alarm),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    child: Icon(Icons.account_balance),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    child: Icon(Icons.beach_access),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    child: Icon(Icons.border_all),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
