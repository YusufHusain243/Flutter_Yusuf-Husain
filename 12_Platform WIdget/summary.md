# (12) Platform Widget

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Platform Widget

1. MaterialApp dan CupertinoApp
   - materialapp adalah widget dasar yang mengemas seluruh widget dalam aplikasi. widget ini adalah widget yang digunakan pada sistem android, dan diimport dari package:flutter/material.dart. selain MaterialApp, ada juga yang namanya CupertinoApp. CupertinoApp adalah widget dasar yang mengemas seluru widget dalam aplikasi. widget ini adalah widget yang digunakan pada sistem IOS. dan diimport dari package:flutter/cupertino.dart
2. Scaffold
   - scaffold adalah widget dasar untuk membangun sebuah halaman pada materialapp. scaffold memiliki struktur yaitu : <br>
     - appBar
     - body
     - bottomNavigationBar
3. CupertinoPageScaffold
   - CupertinoPageScaffold adalah widget dasar untuk membangun sebuah halaman pada CupertinoApp. CupertinoPageScaffold memiliki struktur yaitu : <br>
     - navigationBar
     - child

## Task

1. Buatlah tampilan berikut ini menggunakan flutter material!
2. Buatlah tampilan berikut ini menggunakan flutter Cupertino!

## Pembahasan

1. Berikut adalah program dan outputnya

   - Program

     ```dart
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

     ```

   - Output
     <br>
     ![output1_Task1](https://user-images.githubusercontent.com/74952343/158730749-78e19a98-b661-47f8-8aa4-bffc7ce2301e.jpeg)
     ![output2_Task1](https://user-images.githubusercontent.com/74952343/158730753-029acfac-28d8-465c-835a-4ea080864e90.jpeg)

2. Berikut adalah program dan outputnya

   - Program

     ```dart
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
     ```

- Output
  <br>
  ![output_Task2](https://user-images.githubusercontent.com/74952343/158730776-45321b06-854b-49f4-ab46-20cb73724a60.jpeg)
