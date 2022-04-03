import 'package:flutter/material.dart';

class DetailContact extends StatelessWidget {
  const DetailContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Detail Contacts'),
          ),
          body: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nama : ' + args['name'].toString(),
                  ),
                  Text(
                    'Nomor Telepon : ' + args['telepon'].toString(),
                  ),
                  Text(
                    'Jenis Kelamin : ' + args['jenis_kelamin'].toString(),
                  ),
                  Text(
                    'Status : ' + args['status'].toString(),
                  ),
                  Text(
                    'Bahasa pemrograman : ' +
                        args['bahasa_pemrograman'].join(','),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
