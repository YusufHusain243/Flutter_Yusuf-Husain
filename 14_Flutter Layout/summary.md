# (14) Flutter Layout

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter Layout

1. layout berguna untuk mengatur tata letak dari widget yang ada di dalam sebuah halaman aplikasi. layout ini juga berbentuk widget yang mengatur widget didalamnya. ada 2 tipe layout yaitu single child dan multiple child
2. single child layout. single child layout adalah layout yang hanya memiliki 1 child widget didalamnya. contohnya container, center, dan sizebox.
3. multiple child layout. multiple child layout adalah layout yang memiliki lebih dari 1 child widget didalamnya. contohnya column, row, listview, dan gridview.

## Task

1. buatlah tampilan telegram menggunakan listview
2. buatlah tampilan daftar icon menggunakan gridview

## Jawaban

1. berikut adalajh program dan outputnya

   - program

     ```dart
     import 'package:flutter/material.dart';
     import 'package:http/http.dart' as http;
     import 'dart:convert';

     void main() {
     runApp(MyApp());
     }

     //membuat class get data yang berfungsi untuk memanggil data
     class GetData {
     //memiliki property apiUrl yang berisi url api
     final String apiUrl = "https://reqres.in/api/users?per_page=10";

     // memilikimethod dengan tipe future dan dengan balikan List<dynamic>
     Future<List<dynamic>> _fecthDataUsers() async {
         //mengambil data dari api menggunakan http.get
         var result = await http.get(Uri.parse(apiUrl));
         //mengambalikan data yang sudah didapatkan, yang dikembalikan hanya data yang memiliki key ['data']
         return json.decode(result.body)['data'];
     }
     }

     //membuat class stateles widget
     class MyApp extends StatelessWidget {
     const MyApp({Key? key}) : super(key: key);
     @override
     Widget build(BuildContext context) {
         return MaterialApp(
         debugShowCheckedModeBanner: false,
         home: SafeArea(
             child: Scaffold(
             appBar: AppBar(
                 title: Text('JSON ListView In Flutter'),
             ),
             //didalam body dibuat widget baru dengan nama body
             body: Body(),
             ),
         ),
         );
     }
     }

     //membuat widget baru dengan nama body
     class Body extends StatefulWidget {
     Body({Key? key}) : super(key: key);

     @override
     State<Body> createState() => _BodyState();
     }

     class _BodyState extends State<Body> {
     //memiliki property get Data dimana property ini sebagai penampung class GetData
     var getData = GetData();
     @override
     Widget build(BuildContext context) {
         return Container(
         //membuat widget future builder dengan balikan list
         child: FutureBuilder<List<dynamic>>(
             //pada property future dimasukkan method fetch data user dari clas get data
             future: getData._fecthDataUsers(),
             builder: (BuildContext context, AsyncSnapshot snapshot) {
             //jika data nya ada
             if (snapshot.hasData) {
                 //maka return listview
                 return ListView.builder(
                     padding: EdgeInsets.only(top: 5),
                     //dengan jumlah item adalah panjang dari data
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int index) {
                     //isi dari listview adalah list tile
                     return ListTile(
                         leading: CircleAvatar(
                         radius: 30,
                         backgroundImage:
                             //dengan background image nya adalah data ke-i dengan key avatar
                             NetworkImage(snapshot.data[index]['avatar']),
                         ),
                         //dengan title yaitu adalah data ke-i dengan key first_name
                         title: Text(
                         snapshot.data[index]['first_name'] +
                             " " +
                             //lalu digabungkan dengan data ke -i dengan key last_name
                             snapshot.data[index]['last_name'],
                         style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                         //dan memiliki subtitle dengan data ke-i dengan key email
                         subtitle: Text(snapshot.data[index]['email']),
                     );
                     });
             } else {
                 //jika data tidak ada, maka tampilkan circular progress indicator
                 return Center(child: CircularProgressIndicator());
             }
             },
         ),
         );
     }
     }

     ```

   - output<br>
      ![output_task1](https://user-images.githubusercontent.com/74952343/159401576-f29d0386-98db-45f8-87de-a509c80ae037.jpeg)

2. berikut adalajh program dan outputnya

   - program

     ```dart
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

     ```

   - output<br>
      ![output_task2](https://user-images.githubusercontent.com/74952343/159401609-3ff17113-8710-4e50-8d6a-7255fe027f02.jpeg)

