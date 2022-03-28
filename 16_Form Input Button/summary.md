# (16) Form Input Button

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Form Input Button

1. form adalah sebuah widget yang bergua untuk menerima isian data dari pengguna. isian data dapat lebih dari satu. membuat form biasanya menggunakan statefulwidget.
2. ada beberapa isi didalam form biasanya antara lain adalah:
   - textfield
   - radio
   - checkbox
   - dropdown button
   - button
3. - textfield menerima data dari pengguna dan data dapat lebih dari satu
   - radio memberi opsi pada pengguna dan hanya dapat memilih satu opsi
   - checkbox memberi opsi pada pengguna dan dapat memilih beberapa opsi
   - dropdown button memberi opsi pada pengguna dan hanya dapat memilih satu opsi. opsi tidak ditampilkan diawal, hanya tampil jika ditekan.
   - button bersifat seperti tombol dan dapat melakukan sesuatu saat ditekan.

## Task

1. buatlah sebuah halaman dengan spesifikasi berikut:
   - berjudul "contacts"
   - menampilkan data nama dan nomor telepon(hardcode) dalam listview
2. dari halaman diatas, tambahlkan tombol yang mengarah ke halaman baru dengan spesifikasi berikut:
   - berjudul "create new contacts"
   - menampilkan sebuah form input nama dan nomor telepon
   - menampilkan tombol "submit"

## Jawaban

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

   ```

   ```dart
   class Data {
   List dataContacts = [
       {
       'name': 'YUSUF HUSAIN',
       'telepon': '082121212121',
       },
   ];
   }

   ```

2. hasil
