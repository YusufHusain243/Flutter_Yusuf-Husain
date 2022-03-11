//import material flutter
import 'package:flutter/material.dart';
//import async agar bisa menjalan kan ascyncronus
import 'dart:async';

//fungsi utama menjalankan class fluttertimedemo
void main() => runApp(FlutterTimeDemo());

//class flutter time demo menggunakan stateful widget
class FlutterTimeDemo extends StatefulWidget {
  @override
  _FlutterTimeDemoState createState() => _FlutterTimeDemoState();
}

class _FlutterTimeDemoState extends State<FlutterTimeDemo> {
  //inisialisasi variabel timestring
  String _timeString = '';

  //method init state
  @override
  void initState() {
    //pertama tama variabel timestring diisi jam skrg
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    //tapi setiap 1 detik memanggil jam yang baru dengan method getcurrenttime
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  //build widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          //membuat appbar dengan title flutter widget
          appBar: AppBar(
            title: const Text('Fluter Widget Task 1'),
          ),
          //mmebuat body dengan alignt center
          body: Center(
            //body memiliki text yaitu variabel timestring dengan ukuran 30
            child: Text(
              _timeString,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  //method getcurrenttime
  void _getCurrentTime() {
    //mengeset variabel timestring dengan jam skrg
    setState(() {
      _timeString =
          "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    });
  }
}
