import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/page_2.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

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
            title: Text('Create Post'),
          ),
          drawer: Drawer(),
          body: Body(),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();
  Color _currentColor = Colors.orange;
  String? _caption;
  var _path = '/storage/emulated/0/Download/';
  String _nameFile = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          //builddatepicker
          buildDatePicker(context),

          SizedBox(
            height: 20,
          ),

          //buildcolorpicker
          buildColorPicker(context),

          SizedBox(
            height: 20,
          ),

          //buildfilepicker
          buildFilePicker(context),

          SizedBox(
            height: 20,
          ),

          //buildCaption
          buildCaption(context),

          SizedBox(
            height: 20,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageDua(
                    _dueDate,
                    _currentColor,
                    _caption!,
                    _nameFile,
                  ),
                ),
              );
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Publish At',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: true,
          onTap: () async {
            final selectDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(1990),
              lastDate: DateTime(
                currentDate.year + 5,
              ),
            );
            setState(() {
              if (selectDate != null) {
                _dueDate = selectDate;
              }
            });
          },
          decoration: new InputDecoration(
            hintText: DateFormat('dd-MM-yyyy').format(_dueDate),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Theme',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: true,
          decoration: new InputDecoration(
            hintText: 'Pick a color',
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            fillColor: _currentColor,
            filled: true,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Pick your color',
                  ),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('save'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cover',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
            hintText: 'Pilih file',
            hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            fillColor: Color.fromARGB(255, 94, 94, 94),
            filled: true,
          ),
          onTap: () {
            _pickFile();
          },
        ),
        Column(
          children: [
            Text(
              '$_nameFile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }

  Widget buildCaption(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Caption',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Enter Remarks",
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _caption = value;
            });
          },
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _nameFile = file.name;
      });
    } else {
      return null;
    }
  }
}
