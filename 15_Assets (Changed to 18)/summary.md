# (15) Assets

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Assets

1. assets adalah file yang dibundled dan di deployed bersamaan dengan aplikasi. tipe tipe assets seperti static data(JSON files), icons, images, dan font file(ttf).
2. flutter menggunakan pubspec.yaml untuk mengidentifikasi assets yang dibutuhkan aplikasi. dan menggunakan karakter "/" untuk memasukkan semua assets dibawah satu directory name. misalnya
   ```dart
       assets:
           - assets/my_icon.png
   ```
3. untuk menggunakan asset yang dibuat di pubspec.yaml caranya misalnya Image.assets('assets/my_icon.png')

## Task

1. carilah minimum 3 gambar dari internet, lalu tampilkan menggunakan gridview
2. tambahkan fungsionalitas berikut:
   - ketika sebuah gambar ditekan, akan terbuka halaman baru
   - halaman tersebut menampilkan gambar yang ditekan
   - gambar ditampilkan memenuhi halaman

## Jawaban

1. program

   - main.dart

     ```dart
     import 'package:flutter/material.dart';
     import 'package:carousel_slider/carousel_slider.dart';
     import 'package:flutter_application_1/get_data.dart';
     import 'image_page.dart';
     import 'get_data.dart';

     void main() {
     runApp(MyApp());
     }

     final List imgList = [
     'assets/download.jpg',
     'assets/download1.jpg',
     'assets/download2.jpg',
     ];
     final List<Widget> imageSliders = imgList
         .map(
         (item) => Container(
             child: Container(
             margin: EdgeInsets.only(top: 20, bottom: 20, left: 2, right: 2),
             child: ClipRRect(
                 borderRadius: BorderRadius.all(
                 Radius.circular(10.0),
                 ),
                 child: Stack(
                 children: <Widget>[
                     Image.asset(
                     item,
                     fit: BoxFit.cover,
                     width: 1000.0,
                     ),
                 ],
                 ),
             ),
             ),
         ),
         )
         .toList();

     class MyApp extends StatelessWidget {
     const MyApp({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
         return MaterialApp(
         debugShowCheckedModeBanner: false,
         home: SafeArea(
             child: Scaffold(
             appBar: AppBar(
                 title: Text('Sistem Informasi Wisata'),
             ),
             body: Container(
                 color: Colors.grey[200],
                 child: Column(
                 children: [
                     Header(),
                     SizedBox(
                     height: 10,
                     ),
                     Expanded(
                     child: CardWisata(),
                     ),
                 ],
                 ),
             ),
             ),
         ),
         );
     }
     }

     class CardWisata extends StatefulWidget {
     const CardWisata({Key? key}) : super(key: key);

     @override
     State<CardWisata> createState() => _CardWisataState();
     }

     class _CardWisataState extends State<CardWisata> {
     late Future<Album> futureAlbum;

     @override
     void initState() {
         super.initState();
         futureAlbum = fetchAlbum();
     }

     @override
     Widget build(BuildContext context) {
         return Container(
         width: double.infinity,
         padding: EdgeInsets.all(20),
         color: Colors.white,
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text(
                 'Daftar Wisata',
                 style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 ),
             ),
             SizedBox(
                 height: 10,
             ),
             Expanded(
                 child: FutureBuilder<Album>(
                 future: futureAlbum,
                 builder: (BuildContext context, snapshot) {
                     if (snapshot.hasData) {
                     return GridView.builder(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2),
                         itemCount: snapshot.data!.results.length,
                         itemBuilder: (BuildContext context, int index) {
                         return GestureDetector(
                             onTap: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                 builder: (context) => ImagePage(
                                     data: snapshot.data!.results[index]),
                                 ),
                             );
                             },
                             child: Container(
                             padding: EdgeInsets.all(2),
                             child: Image.network(snapshot.data!.results[index],
                                 fit: BoxFit.cover, width: 1000.0),
                             ),
                         );
                         },
                     );
                     } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                     } else {
                     return Center(
                         child: CircularProgressIndicator(),
                     );
                     }
                 },
                 ),
             ),
             ],
         ),
         );
     }
     }

     class Header extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
         return Container(
         color: Colors.white,
         child: CarouselSlider(
             options: CarouselOptions(
             aspectRatio: 2.0,
             enlargeCenterPage: true,
             enableInfiniteScroll: true,
             initialPage: 2,
             autoPlay: true,
             ),
             items: imageSliders,
         ),
         );
     }
     }
     ```

   - image_page.dart

     ```dart
     import 'package:flutter/material.dart';

     class ImagePage extends StatelessWidget {
     String? data;
     ImagePage({Key? key, this.data}) : super(key: key);

     @override
     Widget build(BuildContext context) {
         return Image.network("$data", fit: BoxFit.cover);
     }
     }
     ```

   - get_data.dart

     ```dart
     import 'dart:convert';

     import 'package:flutter/material.dart';
     import 'package:http/http.dart' as http;

     Future<Album> fetchAlbum() async {
     final response = await http
         .get(Uri.parse('https://imsea.herokuapp.com/api/1?q=natural%20tourism'));

     if (response.statusCode == 200) {
         return Album.fromJson(jsonDecode(response.body));
     } else {
         throw Exception('Failed to load album');
     }
     }

     class Album {
     final List results;

     const Album({
         required this.results,
     });

     factory Album.fromJson(Map<String, dynamic> json) {
         return Album(
         results: json["results"],
         );
     }
     }
     ```

2. output<br>
   

https://user-images.githubusercontent.com/74952343/159828340-ae87071a-96fd-4e11-8e9b-ee5e6e1a7b95.mp4


