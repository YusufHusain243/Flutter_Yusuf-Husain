import 'dart:ui';

//import cupertino agar bisa digunakan
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//fungsi utama
void main() {
  //menjalankan class MyApp
  runApp(MyApp());
}

//membuat class atau widget MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //menggunakan cupertinoApp
    return CupertinoApp(
      //menghilankan debug banner
      debugShowCheckedModeBanner: false,
      //home nya menggunakan safe area
      home: SafeArea(
        //menggunakan cupertinopage scaffold
        child: CupertinoPageScaffold(
          //membuat navigation bar
          navigationBar: CupertinoNavigationBar(
            //menghilangkan border
            border: null,
            //merubah warna background
            backgroundColor: Color.fromARGB(255, 238, 238, 238),
            //leading nya berupa colum
            leading: Column(
              //dengan align bisa dibilang center vertikal
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //didalamnya terdapat text
                Text(
                  'Edit',
                  //denganstyle
                  style: TextStyle(
                    //warna biru
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            //untuk middle nya memiliki text
            middle: Text(
              'Chats',
              //dengan style
              style: TextStyle(
                //font bold
                fontWeight: FontWeight.bold,
              ),
            ),
            //memiliki trailing berupa card
            trailing: Card(
              //merubah warna card
              color: Color.fromARGB(255, 238, 238, 238),
              // memiliki border keliling biru
              shape: Border(
                top: BorderSide(color: Colors.blue),
                bottom: BorderSide(color: Colors.blue),
                left: BorderSide(color: Colors.blue),
                right: BorderSide(color: Colors.blue),
              ),
              //memiliki child paddinng
              child: Padding(
                //dengan semua sisi diberi padding 5
                padding: EdgeInsets.all(5),
                //didalamnya memiliki icon
                child: Icon(
                  //dengan tipe create
                  Icons.create,
                  //dan size nya 15
                  size: 15,
                ),
              ),
            ),
          ),
          //dibawah navbar memiliki child berupa colum
          child: Column(
            children: [
              //yang mana ada topbar ini adalah widget dibawah navbar
              TopBar(),
              //lalu dibawahnya terdpat list view
              Expanded(
                child: ListView(
                  children: [
                    //yang didalamnya memiliki class atau widget cardchat yang dipanggil sebanyak 4 kali
                    CardChat(),
                    CardChat(),
                    CardChat(),
                    CardChat(),
                  ],
                ),
              ),
              //bagian paling bawah terdapat widget atau class Tabbar
              TabBar(),
            ],
          ),
        ),
      ),
    );
  }
}

// membuatclass atau widget tabbar
class TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //didalamnya menggunaka cupertino tabbar
    return CupertinoTabBar(
      //memiliki item
      items: [
        //bottom navigation bar item
        BottomNavigationBarItem(
          //isinya berupa icon
          icon: Icon(CupertinoIcons.person_circle_fill),
          //dan label
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
    );
  }
}

//membuat class atau widget cardchat
class CardChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //dibuat menggunakan card
    return Card(
      //dan dialamny terdapat padding
      child: Padding(
        //dengan semua sisi diberi padding 5
        padding: EdgeInsets.all(5),
        //lalu didalamnya terdapat row
        child: Row(
          //dengan align yaitu space between
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // disetiap row memiliki circle avatar
            CircleAvatar(
              //dengan radius 35
              radius: 35,
            ),
            //lalu terdapat column
            Column(
              //dengan align rata kiri
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //dimana didalam nya terdapat 3 buah widget text dengan style yang berbeda beda, dan setiap widget diberi jarak 5
                Text(
                  'Crypto News',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Boss',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Whar a new weeks we have had',
                  style: TextStyle(
                    color: Color.fromARGB(255, 184, 184, 184),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            //antara widget colum dan text yang terakhir diberi jarak 30
            SizedBox(
              width: 30,
            ),
            //yang terakhir terdapat widget text
            Text('18:00'),
          ],
        ),
      ),
    );
  }
}

//membuat class atau widget topbar
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //didalamnya terdapat container
    return Container(
      //merubah warna container
      color: Color.fromARGB(255, 238, 238, 238),
      //didalamnya terdapat padding dengan semua sisi diberi padding 10
      padding: EdgeInsets.all(10),
      //memiliki colum
      child: Column(
        children: [
          //yang pertama terdapat cupertino search text field
          CupertinoSearchTextField(
            ///dan memiliki padding kiri sebesar 155
            prefixInsets: EdgeInsets.only(left: 155),
          ),
          //lalu diberi jarak kebawah sebesar 15
          SizedBox(
            height: 15,
          ),
          //selanjutnya terdapat row
          Row(
            //dengan align space between
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //didalamnya terdapat text dengan style yang berbeda beda
              Text(
                'All Chats',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 167, 167, 167),
                ),
              ),
              Text(
                'Works',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 167, 167, 167),
                ),
              ),
              Text(
                'Unread',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Personal',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 167, 167, 167),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
