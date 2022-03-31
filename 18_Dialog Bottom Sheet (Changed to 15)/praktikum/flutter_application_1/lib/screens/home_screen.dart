import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter_application_1/models/gambar_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _pathFile;
  GambarModel gambarModel = GambarModel();
  List allGallery = [];

  Future<List> fetchData() async {
    List dataGambar = await gambarModel.dataGambar;
    setState(() {
      allGallery = dataGambar;
    });
    return allGallery;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        daftarGallery(context),
        tambahGallery(context),
      ],
    );
  }

  Widget daftarGallery(BuildContext context) {
    return FutureBuilder<List>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => Image.file(
                          new File(
                            snapshot.data[index].toString(),
                          ),
                        ),
                      );
                    },
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Image.file(
                            new File(
                              snapshot.data[index].toString(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Image.file(
                      new File(
                        snapshot.data[index].toString(),
                      ),
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget tambahGallery(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Text("Tambah Gallery"),
                          content: _pathFile == null
                              ? IconButton(
                                  onPressed: () async {
                                    final result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      PlatformFile file = result.files.first;
                                      setState(() {
                                        _pathFile = file.path;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                )
                              : Image.file(
                                  new File('$_pathFile'),
                                ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                gambarModel.dataGambar.add(_pathFile);
                                _pathFile = null;
                                Navigator.pop(context, gambarModel.dataGambar);
                              },
                              child: Text("Submit"),
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
