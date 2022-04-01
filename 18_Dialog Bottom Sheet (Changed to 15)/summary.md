# (18) Dialog Bottom Sheet (Changed to 15)

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Dialog Bottom Sheet (Changed to 15)

1. ada beberapa contoh dialog pada flutter, misalnya alert dialog dan dialog bottom sheet
2. alert dialog adalah widget untuk tampilan android dari material design, menginformasikan pengguna tentamg situasi tertentu, dan bisa digunakan untuk mendapatkan input dari user, lalu membutuhkan helper method show dialog
3. dialog bottom sheet mirip seperti dialog, tetapi muncul dari bagian bawah layar. menggunakan fungsi bawaan flutter dan membutuhkan 3 properti yaitu context dan builder

## Task

1. buatlah gallery yang menampilkan gambar gambar!
2. bualt lah agat tiap gambar dapat ditampilkan pada bottomsheet saat ditekan!
3. buatlah agar tiap gamabr dapat ditempilkan pada dialog saat ditekan!

## Jawaban

1. program

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/screens/home_screen.dart';

   void main() {
   runApp(const MyApp());
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
               title: Text('Gallery'),
           ),
           body: HomeScreen(),
           ),
       ),
       );
   }
   }
   ```

   ```dart
   import 'package:flutter/material.dart';
   import 'package:file_picker/file_picker.dart';
   import 'dart:io';

   import 'package:flutter_application_1/models/gambar_model.dart';

   class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

   @override
   State<HomeScreen> createState() => _HomeScreenState();
   }

   class _HomeScreenState extends State<HomeScreen> {
   String? _pathFile;
   GambarModel gambarModel = GambarModel();
   List allGallery = [];

   Future<List> fetchData() async {
       List dataGambar = await gambarModel.dataGambar;
       setState(() {
       allGallery = dataGambar;
       });
       return allGallery;
   }

   @override
   Widget build(BuildContext context) {
       return Stack(
       children: [
           daftarGallery(context),
           tambahGallery(context),
       ],
       );
   }

   Widget daftarGallery(BuildContext context) {
       return FutureBuilder<List>(
           future: fetchData(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (snapshot.hasData) {
               return GridView.builder(
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2),
                   itemCount: snapshot.data.length,
                   itemBuilder: (BuildContext context, int index) {
                   return GestureDetector(
                       onTap: () {
                       showModalBottomSheet(
                           shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.vertical(
                               top: Radius.circular(20),
                           ),
                           ),
                           context: context,
                           builder: (context) => Image.file(
                           new File(
                               snapshot.data[index].toString(),
                           ),
                           ),
                       );
                       },
                       onDoubleTap: () {
                       showDialog(
                           context: context,
                           builder: (context) => AlertDialog(
                           content: Image.file(
                               new File(
                               snapshot.data[index].toString(),
                               ),
                           ),
                           actions: [
                               TextButton(
                               onPressed: () {
                                   Navigator.pop(context);
                               },
                               child: Text('Close'),
                               ),
                           ],
                           ),
                       );
                       },
                       child: Image.file(
                       new File(
                           snapshot.data[index].toString(),
                       ),
                       fit: BoxFit.cover,
                       width: 1000.0,
                       ),
                   );
                   });
           } else {
               return CircularProgressIndicator();
           }
           });
   }

   Widget tambahGallery(BuildContext context) {
       return Padding(
       padding: const EdgeInsets.all(15.0),
       child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
           Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
               FloatingActionButton(
                   onPressed: () {
                   showDialog(
                       context: context,
                       builder: (context) {
                       return StatefulBuilder(builder: (context, setState) {
                           return AlertDialog(
                           title: Text("Tambah Gallery"),
                           content: _pathFile == null
                               ? IconButton(
                                   onPressed: () async {
                                       final result =
                                           await FilePicker.platform.pickFiles();
                                       if (result != null) {
                                       PlatformFile file = result.files.first;
                                       setState(() {
                                           _pathFile = file.path;
                                       });
                                       }
                                   },
                                   icon: Icon(
                                       Icons.add_photo_alternate_outlined,
                                       size: 50,
                                       color: Colors.blue,
                                   ),
                                   )
                               : Image.file(
                                   new File('$_pathFile'),
                                   ),
                           actions: <Widget>[
                               TextButton(
                               onPressed: () => Navigator.pop(context),
                               child: Text("Cancel"),
                               ),
                               TextButton(
                               onPressed: () {
                                   gambarModel.dataGambar.add(_pathFile);
                                   _pathFile = null;
                                   Navigator.pop(context, gambarModel.dataGambar);
                               },
                               child: Text("Submit"),
                               ),
                           ],
                           );
                       });
                       },
                   );
                   },
                   child: Icon(
                   Icons.add,
                   ),
               ),
               ],
           ),
           ],
       ),
       );
   }
   }
   ```

   ```dart
   class GambarModel {
   List dataGambar = [
       '/data/user/0/com.example.flutter_application_1/cache/file_picker/download (3).jpg',
   ];
   }
   ```

2. hasil


https://user-images.githubusercontent.com/74952343/160998028-3ca98008-2658-404e-85e5-0ce089e2f0cf.mp4

