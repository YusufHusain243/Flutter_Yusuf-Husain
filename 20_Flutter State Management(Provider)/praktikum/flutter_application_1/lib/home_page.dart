import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/stores/contact.dart' as contact_store;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String phoneNumber = '';

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Book App'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onChanged: (String value) {
                name = value;
              },
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (String value) {
                phoneNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                formKey.currentState!.save();
                contextProvider.add(
                  GetContact(
                    name: name,
                    phoneNumber: phoneNumber,
                  ),
                );
                nameController.clear();
                phoneNumberController.clear();
              },
              child: const Text('Add Number'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contextProvider.contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contextProvider.contacts[index].name),
                    subtitle: Text(contextProvider.contacts[index].phoneNumber),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
