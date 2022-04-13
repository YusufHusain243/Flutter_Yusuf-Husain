import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/contact_provider.dart'
    as provider;
import 'package:shared_preferences/shared_preferences.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  late SharedPreferences data;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      username = data.getString('usernameProvider').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => provider.ContactProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            title: const Text('Provider Page'),
            actions: [
              IconButton(
                onPressed: () {
                  data.setBool('loginProvider', true);
                  data.remove('usernameProvider');
                  // Navigator.of(context).pushNamed('/loginProvider');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
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

  late SharedPreferences data;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      username = data.getString('usernameProvider').toString();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    numberPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<provider.ContactProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 70,
              bottom: 70,
            ),
            child: Text(
              'Selamat Datang, \n' + username,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.black,
        ),
        Expanded(
          child: Stack(
            children: [
              Consumer<provider.ContactProvider>(
                  builder: (context, value, child) {
                return FutureBuilder(
                  future: value.getContact(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: value.contacts.length,
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
                                value.contacts[index].name![0]
                                    .toString()
                                    .toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            value.contacts[index].name.toString(),
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            value.contacts[index].phoneNumber.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }),
              Padding(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.80,
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
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              contextProvider.add(
                                                Contact(
                                                  name: nameController.text,
                                                  phoneNumber:
                                                      numberPhoneController
                                                          .text,
                                                ),
                                              );
                                              Navigator.pop(context);
                                              nameController.clear();
                                              numberPhoneController.clear();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Berhasil Menambahkan Data',
                                                  ),
                                                ),
                                              );
                                            }
                                            return;
                                          },
                                          child: const Text('Simpan'),
                                        )
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
                                                hintText:
                                                    "Masukkan Nama Lengkap",
                                                labelText: "Nama Lengkap",
                                                icon: const Icon(
                                                  Icons.account_box_rounded,
                                                  size: 50,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
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
                                                      BorderRadius.circular(
                                                          5.0),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
