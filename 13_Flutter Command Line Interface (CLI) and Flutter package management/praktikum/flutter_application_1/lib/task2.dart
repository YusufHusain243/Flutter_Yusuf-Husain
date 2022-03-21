import 'package:flutter/material.dart';
//import barcode widget
import 'package:barcode_widget/barcode_widget.dart';
//import badges
import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

//mebuat widget myapp dengan stateless
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('TesBarcode'),
          ),
          body: Padding(
            //pada bode memanggil class atau widget GenerateBarcode
            padding: EdgeInsets.all(20),
            child: GenerateBarcode(),
          ),
        ),
      ),
    );
  }
}

class GenerateBarcode extends StatefulWidget {
  GenerateBarcode({Key? key}) : super(key: key);

  @override
  State<GenerateBarcode> createState() => _GenerateBarcodeState();
}

class _GenerateBarcodeState extends State<GenerateBarcode> {
  String? data;

  Widget generateBarcode() {
    if (data != null) {
      return BarcodeWidget(
        barcode: Barcode.code128(escapes: true),
        data: "$data",
        width: 300,
        height: 100,
      );
    } else {
      return Text(' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Input your data',
            hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          onChanged: (value) {
            setState(() {
              data = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Badge(
          shape: BadgeShape.square,
          badgeColor: Colors.deepPurple,
          borderRadius: BorderRadius.circular(50),
          badgeContent: Text(
            'Hasil Barcode',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        generateBarcode(),
      ],
    );
  }
}
