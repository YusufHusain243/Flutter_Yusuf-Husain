import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/contact_provider.dart'
    as provider;

class Detail extends StatefulWidget {
  final int id;
  const Detail({Key? key, required this.id}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
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
          ),
          body: BodyDetail(id: widget.id.toInt()),
        ),
      ),
    );
  }
}

class BodyDetail extends StatefulWidget {
  int id;
  BodyDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<provider.ContactProvider>(context);
    return Consumer<provider.ContactProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.getContactId(widget.id.toInt()),
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
                        value.contacts[index].id.toString().toUpperCase(),
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
                    value.contacts[index].phone.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
