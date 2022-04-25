import 'package:flutter/material.dart';

class DetailProjectScreen extends StatefulWidget {
  const DetailProjectScreen({Key? key}) : super(key: key);

  @override
  State<DetailProjectScreen> createState() => _DetailProjectScreenState();
}

class _DetailProjectScreenState extends State<DetailProjectScreen> {
  final List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];

  List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Team Works Application'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 50,
                left: 30,
                right: 30,
              ),
              width: double.infinity,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        scale: 7,
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Name Project',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    visualDensity: const VisualDensity(
                      vertical: 2,
                    ),
                    shape: const Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 0, 140, 255),
                      ),
                    ),
                    title: const Text('Website Dinas Kesehatan'),
                    value: _isChecked[index],
                    onChanged: (val) {
                      setState(
                        () {
                          _isChecked[index] = val!;
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
