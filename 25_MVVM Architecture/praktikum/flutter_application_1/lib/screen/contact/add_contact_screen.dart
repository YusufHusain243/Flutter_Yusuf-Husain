import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:provider/provider.dart';

import 'contact_view_model.dart';

class AddContact extends StatefulWidget {
  AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap Anda",
                      labelText: "Nama Lengkap",
                      icon: const Icon(
                        Icons.account_box_rounded,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nomor Telepon Anda",
                      labelText: "Nomor Telepon",
                      icon: const Icon(
                        Icons.phone_rounded,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor Telepon tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await modelView.addContact(
                          Contact(
                            id: 100,
                            name: nameController.toString(),
                            phone: phoneController.toString(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(modelView.status.toString()),
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
          ],
        ),
      ),
    );
  }
}
