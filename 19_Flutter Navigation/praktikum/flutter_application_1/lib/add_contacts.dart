import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

  String _groupValue = "Laki Laki";
  List<String> _jenisKelamin = ["Laki Laki", "Perempuan"];

  List _programmingList = ['PHP', 'JAVA', 'C#'];
  List _selected = [];

  List _status = ['Mahasiswa', 'Bekerja'];
  String? selecttedStatus;

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
                Text('Jenis Kelamin'),
                RadioGroup<String>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupValue,
                  horizontalAlignment: MainAxisAlignment.spaceAround,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value!;
                    });
                  },
                  items: _jenisKelamin,
                  textStyle: TextStyle(fontSize: 15, color: Colors.blue),
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Bahasa Pemrograman'),
                MultiSelectDialogField(
                  items: _programmingList
                      .map((e) => MultiSelectItem(e, e))
                      .toList(),
                  listType: MultiSelectListType.CHIP,
                  onConfirm: (values) {
                    _selected = values;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Status'),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: _status
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selecttedStatus,
                    onChanged: (value) {
                      setState(() {
                        selecttedStatus = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
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
                          'telepon': numberPhoneInput.text,
                          'jenis_kelamin': _groupValue,
                          'status': selecttedStatus,
                          'bahasa_pemrograman': _selected,
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
