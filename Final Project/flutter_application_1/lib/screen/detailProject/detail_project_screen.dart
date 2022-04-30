import 'package:flutter/material.dart';

class DetailProjectScreen extends StatefulWidget {
  int idProject;
  DetailProjectScreen({Key? key, required this.idProject}) : super(key: key);

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
          backgroundColor: const Color.fromARGB(255, 59, 99, 128),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 55, 129, 182),
                padding: const EdgeInsets.all(40),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 59, 99, 128),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {},
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.restore,
                          size: 30,
                        ),
                        title: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.logout,
                          size: 27,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
              color: const Color.fromARGB(255, 59, 99, 128),
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
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  ListView.builder(
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 59, 99, 128),
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
