import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

//membuat class get data yang berfungsi untuk memanggil data
class GetData {
  //memiliki property apiUrl yang berisi url api
  final String apiUrl = "https://reqres.in/api/users?per_page=10";

  // memiliki method dengan tipe future dan dengan balikan List<dynamic>
  Future<List<dynamic>> _fecthDataUsers() async {
    //mengambil data dari api menggunakan http.get
    var result = await http.get(Uri.parse(apiUrl));
    //mengambalikan data yang sudah didapatkan, yang dikembalikan hanya data yang memiliki key ['data']
    return json.decode(result.body)['data'];
  }
}

//membuat class stateles widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('JSON ListView In Flutter'),
          ),
          //didalam body dibuat widget baru dengan nama body
          body: Body(),
        ),
      ),
    );
  }
}

//membuat widget baru dengan nama body
class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //memiliki property get Data dimana property ini sebagai penampung class GetData
  var getData = GetData();
  @override
  Widget build(BuildContext context) {
    return Container(
      //membuat widget future builder dengan balikan list
      child: FutureBuilder<List<dynamic>>(
        //pada property future dimasukkan method fetch data user dari clas get data
        future: getData._fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //jika data nya ada
          if (snapshot.hasData) {
            //maka return listview
            return ListView.builder(
                padding: EdgeInsets.only(top: 5),
                //dengan jumlah item adalah panjang dari data
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  //isi dari listview adalah list tile
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          //dengan background image nya adalah data ke-i dengan key avatar
                          NetworkImage(snapshot.data[index]['avatar']),
                    ),
                    //dengan title yaitu adalah data ke-i dengan key first_name
                    title: Text(
                      snapshot.data[index]['first_name'] +
                          " " +
                          //lalu digabungkan dengan data ke -i dengan key last_name
                          snapshot.data[index]['last_name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //dan memiliki subtitle dengan data ke-i dengan key email
                    subtitle: Text(snapshot.data[index]['email']),
                  );
                });
          } else {
            //jika data tidak ada, maka tampilkan circular progress indicator
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
