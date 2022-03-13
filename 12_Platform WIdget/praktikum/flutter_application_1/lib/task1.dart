import 'dart:ui';

import 'package:flutter/material.dart';

//fungsi utama
void main() {
  //menjalankan class MyApp
  runApp(MyApp());
}

//membuat class MyApp extend dari stateless widget
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Telegram'),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  height: 220,
                  width: 304,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 130,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yusuf Husain',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '+6281xxxxxxxxxx',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.group_sharp),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'New Group',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.lock),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'New Secret Chat',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Container(
                height: 80,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Image.network(
                        'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          Row(
                            children: [
                              Text(
                                'Hai, How Are You?',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('01.24 PM'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(40),
                child: FloatingActionButton(
                  onPressed: null,
                  child: Icon(Icons.create),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
