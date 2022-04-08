import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/data_contact_bloc.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/data_contact_event.dart';
import 'bloc/data_contact_state.dart';

class DetailContact extends StatefulWidget {
  const DetailContact({Key? key}) : super(key: key);

  @override
  State<DetailContact> createState() => _DetailContactState();
}

class _DetailContactState extends State<DetailContact> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DataContact;

    var formKey = GlobalKey<FormState>();
    var namaPanggilanController = TextEditingController();
    var pendidikanController = TextEditingController();
    var alamatController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Detail Kontak',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.read<DataContactBloc>().add(
                      AddDetailContact(
                        args.id,
                        namaPanggilanController.text.toString(),
                        pendidikanController.text.toString(),
                        alamatController.text.toString(),
                      ),
                    );
                namaPanggilanController.clear();
                pendidikanController.clear();
                alamatController.clear();
              },
              child: const Text('Simpan'),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            body(args),
            Expanded(
              child: ListView(
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: BlocBuilder<DataContactBloc, DataContactState>(
                        builder: (context, state) {
                          return state.detailContact.length > args.id - 1
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: namaPanggilanController
                                        ..text = state
                                            .detailContact[args.id - 1]
                                            .namaPanggilan
                                            .toString(),
                                      decoration: InputDecoration(
                                        hintText: 'Masukkan Nama Panggilan',
                                        labelText: "Nama Panggilan",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama Panggilan Tidak Boleh Kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: pendidikanController
                                        ..text = state
                                            .detailContact[args.id - 1]
                                            .pendidikan
                                            .toString(),
                                      decoration: InputDecoration(
                                        hintText:
                                            "Masukkan Pendidikan Terakhir",
                                        labelText: "Pendidikan",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama Panggilan Tidak Boleh Kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: alamatController
                                        ..text = state
                                            .detailContact[args.id - 1].alamat
                                            .toString(),
                                      decoration: InputDecoration(
                                        hintText: "Masukkan Alamat",
                                        labelText: "Alamat",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Alamat tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: namaPanggilanController,
                                      decoration: InputDecoration(
                                        hintText: "Masukkan Nama Panggilan",
                                        labelText: "Nama Panggilan",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama Panggilan Tidak Boleh Kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: pendidikanController,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Masukkan Pendidikan Terakhir",
                                        labelText: "Pendidikan",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama Panggilan Tidak Boleh Kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: alamatController,
                                      decoration: InputDecoration(
                                        hintText: "Masukkan Alamat",
                                        labelText: "Alamat",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Alamat tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                );
                        },
                      ),
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

  Padding body(DataContact args) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.blueAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(45),
                  child: Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Edit Foto'),
              ),
              Text(
                args.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                args.numberPhone,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
