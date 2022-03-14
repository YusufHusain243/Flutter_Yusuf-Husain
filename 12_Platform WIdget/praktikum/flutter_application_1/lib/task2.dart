import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//fungsi utama
void main() {
  //menjalankan class MyApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Color.fromARGB(255, 248, 248, 248),
            middle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Chats',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.create),
                    ],
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 248, 248, 248),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: CupertinoSearchTextField(
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                        itemColor: CupertinoColors.activeBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15, left: 15, bottom: 15, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('All Chats'),
                          Text('Works'),
                          Text(
                            'Unread',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Personal'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CupertinoTabBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_circle_fill),
                    label: 'Contacts',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.phone_fill),
                    label: 'Call',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings),
                    label: 'Settings',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
