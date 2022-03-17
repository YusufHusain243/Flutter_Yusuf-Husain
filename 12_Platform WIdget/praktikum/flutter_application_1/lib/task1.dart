import 'dart:ui';

import 'package:flutter/material.dart';

//fungsi utama
void main() {
  //menjalankan class MyApp
  runApp(MyApp());
}

//membuat class MyApp extend dari stateless widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //menggunakan material App agar bisa menggunakan material widget yang ada
    return MaterialApp(
      //menghilangkan bannen debug
      debugShowCheckedModeBanner: false,
      //menggunakan safe area
      home: SafeArea(
        //menggunakan scaffold
        child: Scaffold(
          //membuat appbar
          appBar: AppBar(
            //dengan titel telegram
            title: Text('Telegram'),
            //lalu memiliki action berupa widget
            actions: <Widget>[
              //diantaranya yang pertama ada padding
              Padding(
                //memiliki padding di sebelah kanan sebesar 15
                padding: EdgeInsets.only(right: 15),
                //didalam nya memiliki icon
                child: Icon(
                  //dengan tipe search
                  Icons.search,
                  //dan ukuran 26
                  size: 26.0,
                ),
              ),
            ],
          ),
          //membuat drawer
          drawer: Drawer(
            //dimana didalamnya memiliki column
            child: Column(
              children: [
                //dah isinya memanggil widget atau class HeaderDrawer
                HeaderDrawer(),
                //lalu dibawahnya memanggil atau class BodyDrawer
                BodyDrawer(),
              ],
            ),
          ),
          //pada body memanggil widget atau class Body
          body: Body(),
          //dan pada bottom navigation bar memanggil widget atau class ButtonBottom
          bottomNavigationBar: ButtonBottom(),
        ),
      ),
    );
  }
}

//membuat class atau widet ButtonBottom
class ButtonBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //membuat row
    return Row(
      //dengan align end atau bisa dibilang di ujung kanan
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //memiliki padding
        Padding(
          //dengan semua sisi diberi padding 30
          padding: EdgeInsets.all(30),
          //lalu didalamnya ada button
          child: FloatingActionButton(
            onPressed: null,
            //dengan icon create
            child: Icon(Icons.create),
          ),
        ),
      ],
    );
  }
}

//membuat class atau widget Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //didalamnya terdapat listview
    return ListView(
      //dengan padding dibagian atas 5
      padding: EdgeInsets.only(top: 5),
      children: [
        //didalamnya memiliki ListTile
        ListTile(
          //dimana leading atau objek paling kiri nya yaitu cricle
          leading: CircleAvatar(
            //dengan radius 30
            radius: 30,
            //dan didalamnya terdapat text YH
            child: Text('YH'),
          ),
          //memiliki title berupa text
          title: Text(
            //dengan isi Yusuf Husain
            'Yusuf Husain',
            //lalu memiliki style
            style: TextStyle(
              //yaitu font nya bold
              fontWeight: FontWeight.bold,
            ),
          ),
          //lalu memiliki subtitle yaitu berupa text
          subtitle: Text('How Are You?'),
          //dan memiliki trailing yang berupa text juga
          trailing: Text('1.32 PM'),
        ),
        //dibawah listtile memiliki sebuah divider
        Divider(
          //dengan thicness sebesar 1
          thickness: 1,
        ),
        //memiliki listile kedua
        ListTile(
          //dimana leading atau objek paling kiri nya yaitu cricle
          leading: CircleAvatar(
            //dengan radius 30
            radius: 30,
            //dan didalamnya terdapat text A
            child: Text('A'),
          ),
          //memiliki title berupa text
          title: Text(
            //dengan isi Yusuf Husain
            'Alex',
            //lalu memiliki style
            style: TextStyle(
              //yaitu font nya bold
              fontWeight: FontWeight.bold,
            ),
          ),
          //lalu memiliki subtitle yaitu berupa text
          subtitle: Text('How Are You?'),
          //dan memiliki trailing yang berupa text juga
          trailing: Text('1.32 PM'),
        ),
        //dibawah listtile memiliki sebuah divider
        Divider(
          //dengan thicness sebesar 1
          thickness: 1,
        ),
      ],
    );
  }
}

//membuat class atau widget BodyDrawer
class BodyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //didalamnya terdapat padding
    return Padding(
      //dengan semua sisinya diberi padding 20
      padding: EdgeInsets.all(20),
      //lalu memiliki column
      child: Column(
        children: [
          //dan didalamnya terdapat row
          Row(
            children: [
              //dan didalam row terdapat icon
              Icon(
                Icons.group_sharp,
              ),
              //lalu diberi jarak dengan size box dengan ukuran 25
              SizedBox(
                width: 25,
              ),
              //lalu terdapat text
              Text(
                'New Group',
                //dengan style
                style: TextStyle(
                  //yaitu font bold
                  fontWeight: FontWeight.bold,
                  //dan dengan ukuran 15
                  fontSize: 15,
                ),
              ),
            ],
          ),
          //setiap row diberi jarak size box yaitu 20.
          //untuk setiap child dari colum ini memiliki konsep yang sama namun yang membedakan hanyalah icon dan text yang ada didalamnya
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.lock,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'New Secret Chat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.campaign,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'New Channel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.account_box,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Contacts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.person_add,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Invite Friends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.quiz_rounded,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Telegram FAQ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//membuat class atau widget HeaderDrawer
class HeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //didalamnya memiliki container
    return Container(
      //dengan warna biru
      color: Colors.blue,
      //lebar container adalah full dari ruang yang ada
      width: double.infinity,
      //didalamnya memiliki padding
      child: Padding(
        //dengan semua sisi diberi padding 20
        padding: EdgeInsets.all(20),
        //didalam padiing memiliki column
        child: Column(
          //dengan align start atau rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //didalam colum yang pertama terdapat circle
            CircleAvatar(
              //dengan backgroun putih
              backgroundColor: Colors.white,
              //dan memiliki radius 50
              radius: 50,
              //lalu didalamnya terdapata text
              child: Text(
                'YH',
                //dengan style
                style: TextStyle(
                  //font bold
                  fontWeight: FontWeight.bold,
                  //dan font size 35
                  fontSize: 35,
                ),
              ),
            ),
            //lalu terdapat sizebox untuk memberi jarak antara circle dan widget berikutnya
            SizedBox(
              height: 20,
            ),
            //selanjutnya terdapat text
            Text(
              'Yusuf Husain',
              //dengan style
              style: TextStyle(
                //font bold
                fontWeight: FontWeight.bold,
                //lalu font size 19
                fontSize: 19,
                //dengan color white
                color: Colors.white,
              ),
            ),
            //lalu diberijarak 5
            SizedBox(
              height: 5,
            ),
            //selanjutnya terdapat text
            Text(
              '+62 818 18181818',
              //dengan style
              style: TextStyle(
                //font size 15
                fontSize: 15,
                //warna putih
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
