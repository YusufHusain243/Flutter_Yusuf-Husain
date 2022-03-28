import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/main.dart';

class AddContacts extends StatefulWidget {
  final List data;
  const AddContacts(this.data);

  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  var nameInput = TextEditingController();
  var numberPhoneInput = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameInput.dispose();
    numberPhoneInput.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameInput.addListener(() {
      final String text = nameInput.text.toUpperCase();
      nameInput.value = nameInput.value.copyWith(
        text: text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create New Contacts'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameInput,
                  decoration: new InputDecoration(
                    hintText: "Masukkan Nama Lengkap Anda",
                    labelText: "Nama Lengkap",
                    icon: Icon(
                      Icons.account_box_rounded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: numberPhoneInput,
                  decoration: new InputDecoration(
                    hintText: "Masukkan Nomor Telepon Anda",
                    labelText: "Nomor Telepon",
                    icon: Icon(
                      Icons.phone_rounded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.data.add(
                        {
                          'name': nameInput.text,
                          'telepon': numberPhoneInput.text
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Tambah Contact Berhasil"),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Tambah Contact'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
