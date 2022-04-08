# (21) Flutter State Management (BLoC)

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter State Management (BLoC)

1.
2.
3.

## Task

1. Buatlah global state dengan BLoC untuk data contacts
2. Tambahkan global state baru dengan BLoC sesuai keinginan anda!

## Jawaban

1. program

   ```dart
   class DataContact {
   int id;
   String name;
   String numberPhone;

   DataContact({
       required this.id,
       required this.name,
       required this.numberPhone,
   });
   }

   class DetailDataContact {
   int id;
   String namaPanggilan;
   String pendidikan;
   String alamat;

   DetailDataContact({
       required this.id,
       required this.namaPanggilan,
       required this.pendidikan,
       required this.alamat,
   });
   }

   ```

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/bloc/contact_bloc.dart';
   import 'package:flutter_application_1/bloc/data_contact_bloc.dart';
   import 'package:flutter_application_1/detail_contact.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';
   import 'contact_page.dart';

   void main() {
   runApp(const MyApp());
   }

   class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MultiBlocProvider(
       providers: [
           BlocProvider<ContactBloc>(
           create: (context) => ContactBloc(),
           ),
           BlocProvider(
           create: (context) => DataContactBloc(),
           ),
       ],
       child: MaterialApp(
           debugShowCheckedModeBanner: false,
           initialRoute: '/',
           routes: {
           '/': (context) => const ContactPage(),
           '/detail_contact': (context) => const DetailContact(),
           },
       ),
       );
   }
   }

   ```

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/bloc/data_contact_bloc.dart';
   import 'package:flutter_application_1/model.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';

   import 'bloc/data_contact_event.dart';
   import 'bloc/data_contact_state.dart';

   class DetailContact extends StatefulWidget {
   const DetailContact({Key? key}) : super(key: key);

   @override
   State<DetailContact> createState() => _DetailContactState();
   }

   class _DetailContactState extends State<DetailContact> {
   @override
   Widget build(BuildContext context) {
       final args = ModalRoute.of(context)!.settings.arguments as DataContact;

       var formKey = GlobalKey<FormState>();
       var namaPanggilanController = TextEditingController();
       var pendidikanController = TextEditingController();
       var alamatController = TextEditingController();

       return SafeArea(
       child: Scaffold(
           appBar: AppBar(
           automaticallyImplyLeading: false,
           title: const Text(
               'Detail Kontak',
               style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.black,
               ),
           ),
           actions: <Widget>[
               TextButton(
               onPressed: () {
                   context.read<DataContactBloc>().add(
                       AddDetailContact(
                           args.id,
                           namaPanggilanController.text.toString(),
                           pendidikanController.text.toString(),
                           alamatController.text.toString(),
                       ),
                       );
                   namaPanggilanController.clear();
                   pendidikanController.clear();
                   alamatController.clear();
               },
               child: const Text('Simpan'),
               ),
           ],
           backgroundColor: Colors.transparent,
           elevation: 0.0,
           ),
           body: Column(
           children: [
               body(args),
               Expanded(
               child: ListView(
                   children: [
                   Form(
                       key: formKey,
                       child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: BlocBuilder<DataContactBloc, DataContactState>(
                           builder: (context, state) {
                           return state.detailContact.length > args.id - 1
                               ? Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                       TextFormField(
                                       controller: namaPanggilanController
                                           ..text = state
                                               .detailContact[args.id - 1]
                                               .namaPanggilan
                                               .toString(),
                                       decoration: InputDecoration(
                                           hintText: 'Masukkan Nama Panggilan',
                                           labelText: "Nama Panggilan",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Nama Panggilan Tidak Boleh Kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                       const SizedBox(
                                       height: 20,
                                       ),
                                       TextFormField(
                                       controller: pendidikanController
                                           ..text = state
                                               .detailContact[args.id - 1]
                                               .pendidikan
                                               .toString(),
                                       decoration: InputDecoration(
                                           hintText:
                                               "Masukkan Pendidikan Terakhir",
                                           labelText: "Pendidikan",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Nama Panggilan Tidak Boleh Kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                       const SizedBox(
                                       height: 20,
                                       ),
                                       TextFormField(
                                       controller: alamatController
                                           ..text = state
                                               .detailContact[args.id - 1].alamat
                                               .toString(),
                                       decoration: InputDecoration(
                                           hintText: "Masukkan Alamat",
                                           labelText: "Alamat",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Alamat tidak boleh kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                   ],
                                   )
                               : Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                       TextFormField(
                                       controller: namaPanggilanController,
                                       decoration: InputDecoration(
                                           hintText: "Masukkan Nama Panggilan",
                                           labelText: "Nama Panggilan",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Nama Panggilan Tidak Boleh Kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                       const SizedBox(
                                       height: 20,
                                       ),
                                       TextFormField(
                                       controller: pendidikanController,
                                       decoration: InputDecoration(
                                           hintText:
                                               "Masukkan Pendidikan Terakhir",
                                           labelText: "Pendidikan",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Nama Panggilan Tidak Boleh Kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                       const SizedBox(
                                       height: 20,
                                       ),
                                       TextFormField(
                                       controller: alamatController,
                                       decoration: InputDecoration(
                                           hintText: "Masukkan Alamat",
                                           labelText: "Alamat",
                                           border: OutlineInputBorder(
                                           borderRadius:
                                               BorderRadius.circular(5.0),
                                           ),
                                       ),
                                       validator: (value) {
                                           if (value!.isEmpty) {
                                           return 'Alamat tidak boleh kosong';
                                           }
                                           return null;
                                       },
                                       ),
                                   ],
                                   );
                           },
                       ),
                       ),
                   ),
                   ],
               ),
               ),
           ],
           ),
       ),
       );
   }

   Padding body(DataContact args) {
       return Padding(
       padding: const EdgeInsets.all(20.0),
       child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Column(
               children: [
               Container(
                   decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(
                       Radius.circular(10),
                   ),
                   color: Colors.blueAccent,
                   ),
                   child: const Padding(
                   padding: EdgeInsets.all(45),
                   child: Text(
                       'A',
                       style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       ),
                   ),
                   ),
               ),
               TextButton(
                   onPressed: () {},
                   child: const Text('Edit Foto'),
               ),
               Text(
                   args.name,
                   style: const TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                   ),
               ),
               Text(
                   args.numberPhone,
                   style: const TextStyle(
                   fontSize: 15,
                   ),
               ),
               ],
           ),
           ],
       ),
       );
   }
   }

   ```

   ```dart
   import 'package:flutter/cupertino.dart';
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/bloc/contact_bloc.dart';
   import 'package:flutter_application_1/bloc/contact_event.dart';
   import 'package:flutter_application_1/bloc/contact_state.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';

   class ContactPage extends StatefulWidget {
   const ContactPage({Key? key}) : super(key: key);

   @override
   State<ContactPage> createState() => _ContactPageState();
   }

   class _ContactPageState extends State<ContactPage> {
   var formKey = GlobalKey<FormState>();
   var nameController = TextEditingController();
   var numberPhoneController = TextEditingController();

   @override
   void dispose() {
       nameController.dispose();
       numberPhoneController.dispose();
       super.dispose();
   }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
       appBar: AppBar(
           title: const Text(
           'Kontak',
           style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.black,
           ),
           ),
           actions: <Widget>[
           IconButton(
               icon: const Icon(
               Icons.add,
               color: Colors.black,
               size: 30,
               ),
               onPressed: () {
               bottomSheet(context);
               },
           ),
           ],
           backgroundColor: Colors.transparent,
           elevation: 0.0,
       ),
       body: Container(
           padding: const EdgeInsets.all(15),
           child: Column(
           children: [
               _contactSearch(),
               const SizedBox(
               height: 30,
               ),
               _listContact(),
           ],
           ),
       ),
       );
   }

   Future<dynamic> bottomSheet(BuildContext context) {
       return showModalBottomSheet(
       isScrollControlled: true,
       shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.vertical(
           top: Radius.circular(20),
           ),
       ),
       context: context,
       builder: (context) => Container(
           padding: const EdgeInsets.all(10),
           height: MediaQuery.of(context).size.height * 0.80,
           decoration: const BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(
               topLeft: Radius.circular(25.0),
               topRight: Radius.circular(25.0),
           ),
           ),
           child: Column(
           children: [
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                   TextButton(
                   onPressed: () {
                       Navigator.pop(context);
                   },
                   child: const Text('Batal'),
                   ),
                   const Text(
                   'Kontak Baru',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                   ),
                   ),
                   BlocBuilder<ContactBloc, ContactState>(
                   builder: (context, state) {
                       return TextButton(
                       onPressed: () {
                           var id =
                               state.contacts[state.contacts.length - 1].id + 1;
                           context.read<ContactBloc>().add(
                               AddContact(
                                   id,
                                   nameController.text,
                                   numberPhoneController.text,
                               ),
                               );
                           nameController.clear();
                           numberPhoneController.clear();
                           Navigator.pop(context);
                       },
                       child: const Text('Simpan'),
                       );
                   },
                   ),
               ],
               ),
               const SizedBox(
               height: 20,
               ),
               Form(
               key: formKey,
               child: Padding(
                   padding: const EdgeInsets.all(10),
                   child: Column(
                   children: [
                       TextFormField(
                       controller: nameController,
                       decoration: InputDecoration(
                           hintText: "Masukkan Nama Lengkap",
                           labelText: "Nama Lengkap",
                           icon: const Icon(
                           Icons.account_box_rounded,
                           size: 50,
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
                       controller: numberPhoneController,
                       decoration: InputDecoration(
                           hintText: "Masukkan Nomor Telepon",
                           labelText: "Nomor Telepon",
                           icon: const Icon(
                           Icons.phone,
                           size: 50,
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
                   ],
                   ),
               ),
               ),
           ],
           ),
       ),
       );
   }

   Expanded _listContact() {
       return Expanded(
       child: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
           return ListView.builder(
           itemCount: state.contacts.length,
           itemBuilder: (BuildContext context, int index) {
               return GestureDetector(
               onTap: () {
                   Navigator.of(context).pushNamed(
                   '/detail_contact',
                   arguments: state.contacts[index],
                   );
               },
               child: ListTile(
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
                       state.contacts[index].name[0].toUpperCase(),
                       style: const TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                       ),
                       ),
                   ),
                   ),
                   title: Text(
                   state.contacts[index].name,
                   style: const TextStyle(
                       fontSize: 19,
                       fontWeight: FontWeight.bold,
                   ),
                   ),
                   subtitle: Text(
                   state.contacts[index].numberPhone,
                   style: const TextStyle(
                       fontSize: 15,
                   ),
                   ),
               ),
               );
           },
           );
       }),
       );
   }

   CupertinoSearchTextField _contactSearch() {
       return CupertinoSearchTextField(
       onChanged: (String value) {},
       onSubmitted: (String value) {},
       );
   }
   }

   ```

   ```dart
   //bloc data contact
   import 'package:equatable/equatable.dart';
   import 'package:flutter_application_1/model.dart';

   class DataContactState extends Equatable {
   List<DetailDataContact> detailContact;

   DataContactState(this.detailContact);
   @override
   List<Object?> get props => [detailContact];
   }

   import 'package:equatable/equatable.dart';

   class DataContactEvent extends Equatable {
   @override
   List<Object> get props => [];
   }

   class AddDetailContact extends DataContactEvent {
   final int id;
   final String namaPanggilan;
   final String pendidikan;
   final String alamat;
   AddDetailContact(
       this.id,
       this.namaPanggilan,
       this.pendidikan,
       this.alamat,
   );
   }

   import 'package:flutter_application_1/bloc/data_contact_event.dart';
   import 'package:flutter_application_1/bloc/data_contact_state.dart';
   import 'package:flutter_application_1/model.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';

   class DataContactBloc extends Bloc<DataContactEvent, DataContactState> {
   DataContactBloc()
       : super(
           DataContactState([
               DetailDataContact(
               id: 1,
               namaPanggilan: 'Usuf',
               pendidikan: 'SMA',
               alamat: 'Palangka Raya',
               )
           ]),
           ) {
       on<AddDetailContact>((event, emit) {
       List<DetailDataContact> newList = List.from(state.detailContact)
           ..add(
           DetailDataContact(
               id: event.id,
               namaPanggilan: event.namaPanggilan,
               pendidikan: event.pendidikan,
               alamat: event.alamat,
           ),
           );
       emit(DataContactState(newList));
       });
   }
   }

   ```

   ```dart
   //bloc contact
   import 'package:equatable/equatable.dart';
   import 'package:flutter_application_1/model.dart';

   class ContactState extends Equatable {
   List<DataContact> contacts;

   ContactState(this.contacts);
   @override
   List<Object?> get props => [contacts];
   }

   import 'package:equatable/equatable.dart';

   abstract class ContactEvent extends Equatable {
   @override
   List<Object> get props => [];
   }

   class AddContact extends ContactEvent {
   final int id;
   final String name;
   final String phoneNumber;
   AddContact(
       this.id,
       this.name,
       this.phoneNumber,
   );
   }

   import 'package:flutter_application_1/bloc/contact_event.dart';
   import 'package:flutter_application_1/bloc/contact_state.dart';
   import 'package:flutter_application_1/model.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';

   class ContactBloc extends Bloc<ContactEvent, ContactState> {
   ContactBloc()
       : super(
           ContactState(
               [
               DataContact(
                   id: 1,
                   name: 'Yusuf',
                   numberPhone: '1111',
               )
               ],
           ),
           ) {
       on<AddContact>(
       (event, emit) {
           List<DataContact> newList = List.from(state.contacts)
           ..add(
               DataContact(
               id: event.id,
               name: event.name,
               numberPhone: event.phoneNumber,
               ),
           );
           emit(ContactState(newList));
       },
       );
   }
   }

   ```

2. output
