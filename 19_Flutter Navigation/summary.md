# (18) Flutter Navigator

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter Navigator

1. Navigation adalah proses berpindah dari halaman satu ke halaman lain. ada 2 tipe navigation yang pertama navigation dasar dan yang kedua navigation dengan named routes.
2. navigation dasar
   perpindahan halaman menggunakan navigator.push dan proses kembalik ke halama sebelumnya menggunakan navigator.pop()
3. navigation dengan named routes
   adalah perpindahan halaman menggunakan navigator.pushnamed() dan kembali ke halaman sebelumnya menggunakan navigator.pop()

## Task

1. Buatlah halama contacts yang menampilkan data contacts memnggynakan listview dan letakkan button untuk membuka halaman create contact
2. lakuka navigation diatas tanpa named routes

## Pembahasan

1. program

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/add_contacts.dart';
   import 'package:flutter_application_1/data.dart';

   void main() {
   runApp(const MyApp());
   }

   class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SafeArea(
           child: Scaffold(
           appBar: AppBar(
               title: Text('Contacts'),
           ),
           body: Body(),
           ),
       ),
       );
   }
   }

   class Body extends StatefulWidget {
   Body({Key? key}) : super(key: key);

   @override
   State<Body> createState() => _BodyState();
   }

   class _BodyState extends State<Body> {
   Data data = new Data();

   List allDataContacts = [];

   Future<List> fetchData() async {
       List dataContacts = await data.dataContacts;
       setState(() {
       allDataContacts = dataContacts;
       });
       return allDataContacts;
   }

   @override
   Widget build(BuildContext context) {
       return Stack(
       children: [
           FutureBuilder<List<dynamic>>(
           future: fetchData(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
               if (snapshot.hasData) {
               return ListView.builder(
                   padding: EdgeInsets.only(top: 5),
                   itemCount: snapshot.data.length,
                   itemBuilder: (BuildContext context, int index) {
                   return ListTile(
                       title: Text(
                       snapshot.data[index]['name'],
                       style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                       subtitle: Text(snapshot.data[index]['telepon']),
                       onLongPress: () => showDialog<String>(
                       context: context,
                       builder: (BuildContext context) => AlertDialog(
                           title: const Text('Hapus Data'),
                           content: const Text('Yakin hapus data?'),
                           actions: <Widget>[
                           TextButton(
                               onPressed: () => Navigator.pop(context),
                               child: const Text('Cancel'),
                           ),
                           TextButton(
                               onPressed: () {
                               allDataContacts.remove(snapshot.data[index]);
                               ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                   content: Text("Hapus Contact Berhasil"),
                                   ),
                               );
                               Navigator.pop(context);
                               },
                               child: const Text('OK'),
                           ),
                           ],
                       ),
                       ),
                       onTap: () {
                       showModalBottomSheet(
                           context: context,
                           isScrollControlled: true,
                           builder: (context) {
                           return SizedBox(
                               height: 200,
                               child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                   Text(snapshot.data[index]['name']),
                                   Text(snapshot.data[index]['telepon']),
                                   Text(snapshot.data[index]['jenis_kelamin']),
                                   Text(snapshot.data[index]['status'].toString()),
                                   Text(
                                   snapshot.data[index]['bahasa_pemrograman']
                                       .toString(),
                                   ),
                               ],
                               ),
                           );
                           },
                       );
                       },
                   );
                   },
               );
               } else {
               return CircularProgressIndicator();
               }
           },
           ),
           Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
               Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                   Padding(
                   padding: EdgeInsets.all(20),
                   child: FloatingActionButton(
                       onPressed: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                           builder: (context) => AddContacts(data.dataContacts),
                           ),
                       );
                       },
                       child: Icon(Icons.add),
                   ),
                   ),
               ],
               ),
           ],
           ),
       ],
       );
   }
   }

   ```

   ```dart
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

   ```

   ```dart
   class Data {
   List dataContacts = [
       {
       'name': 'YUSUF HUSAIN',
       'telepon': '082121212121',
       'jenis_kelamin': 'Laki-Laki',
       'status': 'Mahasiswa',
       'bahasa_pemrograman': ['PHP', 'C#'],
       },
   ];
   }

   ```

2. output


https://user-images.githubusercontent.com/74952343/161213094-41a4e90e-db0a-4219-a25d-675a27616593.mp4

