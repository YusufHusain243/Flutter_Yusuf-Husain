import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact/contact_view_state.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<ContactViewModel>(context, listen: false);
      await viewModel.getContactId(widget.id.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Contact'),
      ),
      body: Center(
        child: Consumer<ContactViewModel>(
          builder: (context, value, child) {
            if (value.state == ContactViewState.loading) {
              return const CircularProgressIndicator();
            }

            if (value.state == ContactViewState.error) {
              return const Text('Get Data Failed!');
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.contactId.name),
                Text(value.contactId.phone),
              ],
            );
          },
        ),
      ),
    );
  }
}
