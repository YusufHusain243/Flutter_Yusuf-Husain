import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_view_model.dart';

class DetailContactScreen extends StatefulWidget {
  int id;
  DetailContactScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailContactScreen> createState() => _DetailContactScreenState();
}

class _DetailContactScreenState extends State<DetailContactScreen> {
  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Contact'),
      ),
      body: Center(
        child: FutureBuilder(
          future: modelView.getContactId(widget.id.toInt()),
          builder: (context, snapshot) {
            if (modelView.contactId == null) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(modelView.contactId!.id.toString()),
                  Text(modelView.contactId!.name.toString()),
                  Text(modelView.contactId!.phone.toString()),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
