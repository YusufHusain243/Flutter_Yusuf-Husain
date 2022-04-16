import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contact_bloc.dart';
import 'package:flutter_application_1/bloc/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/contact_event.dart';

class BLocPage extends StatelessWidget {
  const BLocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BLoC Page'),
          ),
          body: const Body(),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var numberPhoneController = TextEditingController();

  late ContactBloc _contactBloc;
  late SharedPreferences prefs;

  String? contactString = '';

  @override
  void initState() {
    _contactBloc = BlocProvider.of<ContactBloc>(context);
    _contactBloc.add(GetContact());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    numberPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
          if (state.contacts != null) {
            return ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.blueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        state.contacts[index].name.toString()[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    state.contacts[index].name.toString(),
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    state.contacts[index].phone.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(state.status.toString()),
            );
          }
        }),
        const SizedBox(
          height: 20,
        ),
        BlocConsumer<ContactBloc, ContactState>(
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.status.toString()),
              ),
            );
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.80,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Batal'),
                                      ),
                                      const Text(
                                        'Kontak Baru',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            _contactBloc.add(
                                              AddContact(
                                                5,
                                                nameController.text,
                                                numberPhoneController.text,
                                              ),
                                            );
                                            Navigator.pop(context);
                                            nameController.clear();
                                            numberPhoneController.clear();
                                            print(state.status);
                                          }
                                          return;
                                        },
                                        child: const Text('Simpan'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Form(
                                    key: formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan Nama Lengkap",
                                              labelText: "Nama Lengkap",
                                              icon: const Icon(
                                                Icons.account_box_rounded,
                                                size: 50,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Nama tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: numberPhoneController,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Masukkan Nomor Telepon",
                                              labelText: "Nomor Telepon",
                                              icon: const Icon(
                                                Icons.phone,
                                                size: 50,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Nomor Telepon tidak boleh kosong';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
