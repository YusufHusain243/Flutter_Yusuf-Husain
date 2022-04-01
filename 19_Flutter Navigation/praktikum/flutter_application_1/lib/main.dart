import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_contacts.dart';
import 'package:flutter_application_1/data.dart';

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
            title: Text('Contacts'),
          ),
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
  Data data = new Data();

  List allDataContacts = [];

  Future<List> fetchData() async {
    List dataContacts = await data.dataContacts;
    setState(() {
      allDataContacts = dataContacts;
    });
    return allDataContacts;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(snapshot.data[index]['telepon']),
                    onLongPress: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Hapus Data'),
                        content: const Text('Yakin hapus data?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              allDataContacts.remove(snapshot.data[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Hapus Contact Berhasil"),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data[index]['name']),
                                Text(snapshot.data[index]['telepon']),
                                Text(snapshot.data[index]['jenis_kelamin']),
                                Text(snapshot.data[index]['status'].toString()),
                                Text(
                                  snapshot.data[index]['bahasa_pemrograman']
                                      .toString(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddContacts(data.dataContacts),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
