# (22) Flutter Animation

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter Animation

1. animation
   adalah animasi yang membuat aplikasi terlihat hidup. widget yang bergerak dapat menambah daya tarik.
2. implicit animation
   adalah versi animasi dari widget yang sudah ada
3. transition
   animasi yang terjadi saat perpindahan halaman. dilakukan pada bagian navigator.push();

## Task

1. buatlah sebuah halaman dengan spesifikasi berikut:
   - menampilkan sebuah gambar kecil di posisi tengah,
   - jika gambar diklik akan membesar
   - jika diklik kembali, akan mengecil (ukuran semula)
   - proses perubahan gambar menggunakan animasi
2. tambahkan transisi saat perpindahan halaman contact ke create contact

## Jawaban

1. program

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/contact_page.dart';

   class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);

   @override
   State<SplashScreen> createState() => _SplashScreenState();
   }

   class _SplashScreenState extends State<SplashScreen> {
   bool isBig = false;

   @override
   Widget build(BuildContext context) {
       return SafeArea(
       child: Scaffold(
           body: Container(
           decoration: const BoxDecoration(
               gradient: LinearGradient(
               begin: Alignment.topRight,
               end: Alignment.bottomLeft,
               colors: [
                   Colors.blue,
                   Colors.red,
               ],
               ),
           ),
           child: Center(
               child: GestureDetector(
               onTap: () {
                   setState(() {
                   isBig = true;
                   });
               },
               onDoubleTap: () {
                   if (isBig == true) {
                   Navigator.of(context).push(
                       PageRouteBuilder(
                       pageBuilder: (context, animation, secondaryAnimation) {
                           return const ContactPage();
                       },
                       transitionsBuilder: (
                           context,
                           animation,
                           secondaryAnimation,
                           child,
                       ) {
                           final tween = Tween(
                           begin: const Offset(0, -1),
                           end: Offset.zero,
                           );
                           return SlideTransition(
                           position: animation.drive(tween),
                           child: child,
                           );
                       },
                       ),
                   );
                   }
                   setState(() {
                   isBig = false;
                   });
               },
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   AnimatedContainer(
                       duration: const Duration(seconds: 1),
                       width: isBig ? 200 : 100,
                       height: isBig ? 200 : 100,
                       child: Image.asset(
                       'images/icon_contact.png',
                       ),
                   ),
                   Text(
                       isBig ? 'Double tap to open' : 'Tap to open',
                       textAlign: TextAlign.center,
                       style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       ),
                   )
                   ],
               ),
               ),
           ),
           ),
       ),
       );
   }
   }

   ```

2. output


https://user-images.githubusercontent.com/74952343/162423426-67df0214-1a94-41ca-bb45-9a2115ad44e4.mp4

