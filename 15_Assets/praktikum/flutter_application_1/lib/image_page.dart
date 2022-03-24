import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  String? data;
  ImagePage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network("$data", fit: BoxFit.cover);
  }
}
