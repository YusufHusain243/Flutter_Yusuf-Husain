import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact/add_contact_screen.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/contact/contact_view_state.dart';
import 'package:flutter_application_1/screen/contact/detail_contact_screen.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<ContactViewModel>(context, listen: false);
      await viewModel.getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contact'),
      ),
      body: Container(
        child: Consumer<ContactViewModel>(
          builder: (context, value, child) {
            if (value.state == ContactViewState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (value.state == ContactViewState.none) {
              return ListView.builder(
                itemCount: value.contacts.length,
                itemBuilder: (context, index) {
                  final contact = value.contacts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailContactScreen(
                            id: contact.id,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: Text('Get Data Failed!'),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddContact(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
