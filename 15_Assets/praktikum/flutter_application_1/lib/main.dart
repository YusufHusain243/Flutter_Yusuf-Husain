import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/get_data.dart';
import 'image_page.dart';
import 'get_data.dart';

void main() {
  runApp(MyApp());
}

final List imgList = [
  'assets/download.jpg',
  'assets/download1.jpg',
  'assets/download2.jpg',
];
final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 2, right: 2),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sistem Informasi Wisata'),
          ),
          body: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: CardWisata(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWisata extends StatefulWidget {
  const CardWisata({Key? key}) : super(key: key);

  @override
  State<CardWisata> createState() => _CardWisataState();
}

class _CardWisataState extends State<CardWisata> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Wisata',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImagePage(
                                  data: snapshot.data!.results[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: Image.network(snapshot.data!.results[index],
                              fit: BoxFit.cover, width: 1000.0),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
