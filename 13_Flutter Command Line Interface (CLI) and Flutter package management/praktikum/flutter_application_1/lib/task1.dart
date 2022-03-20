import 'package:flutter/material.dart';
//mengimport package badges.dart agar bisa menggunakan widget badge
import 'package:badges/badges.dart';

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
            title: Text('TesBadge'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //membuat chip bentukan chip hampir mirip dengan badge namun memiliki ukuran yang agak besar meskipun padding diset menjadi 0
                Chip(
                  backgroundColor: Colors.deepPurple,
                  label: Text(
                    'BADGE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //badge memiliki customisasi yang lebih fleksibel
                Badge(
                  //misal terdapat bentuk square dan circle
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepPurple,
                  //bisa juga menambahkan border radius yang diinginkan
                  borderRadius: BorderRadius.circular(50),
                  badgeContent: Text(
                    'BADGE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
