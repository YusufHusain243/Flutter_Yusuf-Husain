import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageDua extends StatefulWidget {
  final DateTime date;
  final Color color;
  final nameFile;
  final String caption;
  const PageDua(this.date, this.color, this.caption, this.nameFile);

  @override
  State<PageDua> createState() => _PageDuaState();
}

class _PageDuaState extends State<PageDua> {
  var _path = '/storage/emulated/0/Download/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Preview Post'),
        ),
        body: Column(
          children: [
            Image.file(
              new File('$_path/' + widget.nameFile),
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Published: ' +
                            DateFormat('dd-MM-yyyy').format(widget.date),
                      ),
                      Row(
                        children: [
                          Text('Color'),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: widget.color,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.caption,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
