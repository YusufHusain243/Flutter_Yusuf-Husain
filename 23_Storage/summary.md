# (23) Storage

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Storage

1. Penyimpanan lokal diperlukan untuk efisiensi penggunaan data
   internet. ada beberapa cara implementasi penyimpanan lokal, contohnya seperti : SharedPrefences, dan Local Database
2. SharedPreferences
   SharedPreferences menyimpan data yang sederhana dan penyimpanan data dengan format key-value. SharedPreferences menyimpan data dengan tipe data dasar seperti teks, angka dan boolean.
3. Local Database (SQLite)
   SQLite menyimpan dan meminta data dalam jumlah besar pada local device. data tersebut bersifat private.

## Task

1. pindahkan data dari global state provider ke SharedPreferences
2. Lakukan hal yang sama untuk BLoC

## Jawaban

1.  Program

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/pages/BLoC/bloc_page.dart';
        import 'package:flutter_application_1/pages/BLoC/login_bloc.dart';
        import 'package:flutter_application_1/pages/home_page.dart';
        import 'package:flutter_application_1/pages/provider/login_provider.dart';
        import 'package:flutter_application_1/pages/provider/provider_page.dart';

        void main() {
        runApp(const MyApp());
        }

        class MyApp extends StatelessWidget {
        const MyApp({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
                '/': (context) => const HomePage(),
                '/loginProvider': (context) => const LoginProvider(),
                '/providerPage': (context) => const ProviderPage(),
                '/loginBloc': (context) => const LoginBLoC(),
                '/blocPage': (context) => const BLocPage(),
            },
            );
        }
        }
        ```

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/model/contact.dart';
        import 'package:shared_preferences/shared_preferences.dart';

        class ContactProvider extends ChangeNotifier {
        List<Contact> _contacts = [];
        List<Contact> get contacts => _contacts;

        void add(Contact contact) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            _contacts.add(contact);
            final String dataContact = Contact.encode(_contacts);
            await prefs.setString('contact', dataContact);
            notifyListeners();
        }

        Future<void> getContact() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final String? contactString = prefs.getString('contact');
            final List<Contact> data = Contact.decode(contactString!);
            _contacts = data;
            notifyListeners();
        }
        }
        ```

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/model/contact.dart';
        import 'package:flutter_application_1/pages/home_page.dart';
        import 'package:provider/provider.dart';
        import 'package:flutter_application_1/provider/contact_provider.dart'
            as provider;
        import 'package:shared_preferences/shared_preferences.dart';

        class ProviderPage extends StatefulWidget {
        const ProviderPage({Key? key}) : super(key: key);

        @override
        State<ProviderPage> createState() => _ProviderPageState();
        }

        class _ProviderPageState extends State<ProviderPage> {
        late SharedPreferences data;
        String username = '';

        @override
        void initState() {
            super.initState();
            initial();
        }

        void initial() async {
            data = await SharedPreferences.getInstance();
            setState(() {
            username = data.getString('usernameProvider').toString();
            });
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
                    actions: [
                    IconButton(
                        onPressed: () {
                        data.setBool('loginProvider', true);
                        data.remove('usernameProvider');
                        // Navigator.of(context).pushNamed('/loginProvider');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(),
                            ),
                            (route) => false);
                        },
                        icon: const Icon(Icons.exit_to_app),
                    ),
                    ],
                ),
                body: const Body(),
                ),
            ),
            );
        }
        }

        class Body extends StatefulWidget {
        const Body({Key? key}) : super(key: key);

        @override
        State<Body> createState() => _BodyState();
        }

        class _BodyState extends State<Body> {
        var formKey = GlobalKey<FormState>();
        var nameController = TextEditingController();
        var numberPhoneController = TextEditingController();

        late SharedPreferences data;
        String username = '';

        @override
        void initState() {
            super.initState();
            initial();
        }

        void initial() async {
            data = await SharedPreferences.getInstance();
            setState(() {
            username = data.getString('usernameProvider').toString();
            });
        }

        @override
        void dispose() {
            nameController.dispose();
            numberPhoneController.dispose();
            super.dispose();
        }

        @override
        Widget build(BuildContext context) {
            final contextProvider = Provider.of<provider.ContactProvider>(context);
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(
                child: Padding(
                    padding: const EdgeInsets.only(
                    left: 15,
                    top: 70,
                    bottom: 70,
                    ),
                    child: Text(
                    'Selamat Datang, \n' + username,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                ),
                const Divider(
                height: 10,
                color: Colors.black,
                ),
                Expanded(
                child: Stack(
                    children: [
                    Consumer<provider.ContactProvider>(
                        builder: (context, value, child) {
                        return FutureBuilder(
                        future: value.getContact(),
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
                                        value.contacts[index].name![0]
                                            .toString()
                                            .toUpperCase(),
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
                                    value.contacts[index].phoneNumber.toString(),
                                    style: const TextStyle(
                                    fontSize: 15,
                                    ),
                                ),
                                );
                            },
                            );
                        },
                        );
                    }),
                    Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                FloatingActionButton(
                                onPressed: () {
                                    showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                        ),
                                    ),
                                    context: context,
                                    builder: (context) => Container(
                                        padding: const EdgeInsets.all(10),
                                        height:
                                            MediaQuery.of(context).size.height * 0.80,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                TextButton(
                                                onPressed: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                    contextProvider.add(
                                                        Contact(
                                                        name: nameController.text,
                                                        phoneNumber:
                                                            numberPhoneController
                                                                .text,
                                                        ),
                                                    );
                                                    Navigator.pop(context);
                                                    nameController.clear();
                                                    numberPhoneController.clear();
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                        const SnackBar(
                                                        content: Text(
                                                            'Berhasil Menambahkan Data',
                                                        ),
                                                        ),
                                                    );
                                                    }
                                                    return;
                                                },
                                                child: const Text('Simpan'),
                                                )
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
                                                        hintText:
                                                            "Masukkan Nama Lengkap",
                                                        labelText: "Nama Lengkap",
                                                        icon: const Icon(
                                                        Icons.account_box_rounded,
                                                        size: 50,
                                                        ),
                                                        border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5.0),
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
                                                        hintText:
                                                            "Masukkan Nomor Telepon",
                                                        labelText: "Nomor Telepon",
                                                        icon: const Icon(
                                                        Icons.phone,
                                                        size: 50,
                                                        ),
                                                        border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5.0),
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
                                },
                                child: const Icon(Icons.add),
                                ),
                            ],
                            ),
                        ],
                        ),
                    ),
                    ],
                ),
                ),
            ],
            );
        }
        }
        ```

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/pages/provider/provider_page.dart';
        import 'package:shared_preferences/shared_preferences.dart';

        class LoginProvider extends StatefulWidget {
        const LoginProvider({Key? key}) : super(key: key);

        @override
        State<LoginProvider> createState() => _LoginProviderState();
        }

        class _LoginProviderState extends State<LoginProvider> {
        var formKey = GlobalKey<FormState>();
        var usernameController = TextEditingController();
        var passwordController = TextEditingController();

        late SharedPreferences loginData;
        late bool newUser;

        void checkLogin() async {
            loginData = await SharedPreferences.getInstance();
            newUser = loginData.getBool('loginProvider') ?? true;

            if (newUser == false) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => const ProviderPage(),
                ),
            );
            // Navigator.of(context).pushNamed('/providerPage');
            }
        }

        @override
        void initState() {
            super.initState();
            checkLogin();
        }

        @override
        void dispose() {
            usernameController.dispose();
            passwordController.dispose();
            super.dispose();
        }

        @override
        Widget build(BuildContext context) {
            return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                title: const Text(
                    'Login Provider',
                ),
                ),
                body: Column(
                children: [
                    Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                        children: [
                            TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                hintText: "Masukkan Username",
                                labelText: "Username",
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
                                return 'Username boleh kosong';
                                }
                                return null;
                            },
                            ),
                            const SizedBox(
                            height: 20,
                            ),
                            TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                labelText: "Password",
                                icon: const Icon(
                                Icons.vpn_key_outlined,
                                size: 50,
                                ),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            validator: (value) {
                                if (value!.isEmpty) {
                                return 'Password tidak boleh kosong';
                                }
                                return null;
                            },
                            ),
                            const SizedBox(
                            height: 20,
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () {
                                final isValidForm = formKey.currentState!.validate();
                                String username = usernameController.text;
                                if (isValidForm) {
                                loginData.setBool('loginProvider', false);
                                loginData.setString('usernameProvider', username);
                                // Navigator.of(context).pushNamed('/providerPage');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ProviderPage(),
                                    ),
                                    (route) => true);
                                }
                            },
                            child: const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                            ),
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
        }
        ```

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/pages/BLoC/bloc_page.dart';
        import 'package:shared_preferences/shared_preferences.dart';

        class LoginBLoC extends StatefulWidget {
        const LoginBLoC({Key? key}) : super(key: key);

        @override
        State<LoginBLoC> createState() => _LoginBLoCState();
        }

        class _LoginBLoCState extends State<LoginBLoC> {
        var formKey = GlobalKey<FormState>();
        var usernameController = TextEditingController();
        var passwordController = TextEditingController();

        late SharedPreferences loginData;
        late bool newUser;

        void checkLogin() async {
            loginData = await SharedPreferences.getInstance();
            newUser = loginData.getBool('loginBloc') ?? true;

            if (newUser == false) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => const BLocPage(),
                ),
            );
            // Navigator.of(context).pushNamed('/providerPage');
            }
        }

        @override
        void initState() {
            super.initState();
            checkLogin();
        }

        @override
        void dispose() {
            usernameController.dispose();
            passwordController.dispose();
            super.dispose();
        }

        @override
        Widget build(BuildContext context) {
            return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                title: const Text(
                    'Login BLoC',
                ),
                ),
                body: Column(
                children: [
                    Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                        children: [
                            TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                hintText: "Masukkan Username",
                                labelText: "Username",
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
                                return 'Username boleh kosong';
                                }
                                return null;
                            },
                            ),
                            const SizedBox(
                            height: 20,
                            ),
                            TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                labelText: "Password",
                                icon: const Icon(
                                Icons.vpn_key_outlined,
                                size: 50,
                                ),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                ),
                            ),
                            validator: (value) {
                                if (value!.isEmpty) {
                                return 'Password tidak boleh kosong';
                                }
                                return null;
                            },
                            ),
                            const SizedBox(
                            height: 20,
                            ),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () {
                                final isValidForm = formKey.currentState!.validate();
                                String username = usernameController.text;
                                if (isValidForm) {
                                loginData.setBool('loginBloc', false);
                                loginData.setString('usernameBloc', username);
                                // Navigator.of(context).pushNamed('/providerPage');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BLocPage(),
                                    ),
                                    (route) => true);
                                }
                            },
                            child: const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                            ),
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
        }
        ```

        ```dart
        import 'package:flutter/material.dart';
        import 'package:flutter_application_1/bloc/contact_bloc.dart';
        import 'package:flutter_application_1/bloc/contact_state.dart';
        import 'package:flutter_bloc/flutter_bloc.dart';
        import 'package:shared_preferences/shared_preferences.dart';

        import '../../bloc/contact_event.dart';

        class BLocPage extends StatelessWidget {
        const BLocPage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return BlocProvider(
            create: (context) => ContactBloc(),
            child: SafeArea(
                child: Scaffold(
                appBar: AppBar(
                    title: const Text('BLoC Page'),
                ),
                body: const Body(),
                ),
            ),
            );
        }
        }

        class Body extends StatefulWidget {
        const Body({Key? key}) : super(key: key);

        @override
        State<Body> createState() => _BodyState();
        }

        class _BodyState extends State<Body> {
        var formKey = GlobalKey<FormState>();
        var nameController = TextEditingController();
        var numberPhoneController = TextEditingController();

        late ContactBloc _contactBloc;
        late SharedPreferences prefs;

        String? contactString = '';

        @override
        void initState() {
            _contactBloc = BlocProvider.of<ContactBloc>(context);
            _contactBloc.add(GetContact());
            super.initState();
        }

        @override
        void dispose() {
            nameController.dispose();
            numberPhoneController.dispose();
            super.dispose();
        }

        @override
        Widget build(BuildContext context) {
            return Stack(
            children: [
                BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
                return ListView.builder(
                    itemCount: state.contacts.length,
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
                            state.contacts[index].name![0].toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                            ),
                            ),
                        ),
                        ),
                        title: Text(
                        state.contacts[index].name.toString(),
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        subtitle: Text(
                        state.contacts[index].phoneNumber.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                        ),
                        ),
                    );
                    },
                );
                }),
                const SizedBox(
                height: 20,
                ),
                Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        FloatingActionButton(
                            onPressed: () {
                            showModalBottomSheet(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        TextButton(
                                            onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                                _contactBloc.add(
                                                AddContact(
                                                    nameController.text,
                                                    numberPhoneController.text,
                                                ),
                                                );
                                                Navigator.pop(context);
                                                nameController.clear();
                                                numberPhoneController.clear();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                    'Berhasil Menambahkan Data',
                                                    ),
                                                ),
                                                );
                                            }
                                            return;
                                            },
                                            child: const Text('Simpan'),
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
                                                    borderRadius:
                                                        BorderRadius.circular(5.0),
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
                                                    borderRadius:
                                                        BorderRadius.circular(5.0),
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
                            },
                            child: const Icon(Icons.add),
                        ),
                        ],
                    ),
                    ],
                ),
                ),
            ],
            );
        }
        }
        ```

        ```dart
        import 'dart:convert';

        class Contact {
        String? name;
        String? phoneNumber;

        Contact({
            this.name,
            this.phoneNumber,
        });

        factory Contact.fromJson(Map<String, dynamic> json) {
            return Contact(
            name: json['name'],
            phoneNumber: json['phoneNumber'],
            );
        }

        static Map<String, dynamic> toJson(Contact contact) => {
                'name': contact.name,
                'phoneNumber': contact.phoneNumber,
            };

        static String encode(List<Contact> contacts) => json.encode(
                contacts
                    .map<Map<String, dynamic>>((contact) => Contact.toJson(contact))
                    .toList(),
            );

        static List<Contact> decode(String contacts) =>
            (json.decode(contacts) as List<dynamic>)
                .map<Contact>((item) => Contact.fromJson(item))
                .toList();
        }
        ```

        ```dart
        import 'package:equatable/equatable.dart';
        import 'package:flutter_application_1/model/contact.dart';

        class ContactState extends Equatable {
        List<Contact> contacts;

        ContactState(this.contacts);
        @override
        List<Object?> get props => [contacts];
        }
        ```

        ```dart
        import 'package:equatable/equatable.dart';

        abstract class ContactEvent extends Equatable {
        @override
        List<Object> get props => [];
        }

        class AddContact extends ContactEvent {
        final String name;
        final String phoneNumber;
        AddContact(
            this.name,
            this.phoneNumber,
        );
        }

        class GetContact extends ContactEvent {}
        ```

        ```dart
        import 'package:flutter_application_1/bloc/contact_event.dart';
        import 'package:flutter_application_1/bloc/contact_state.dart';
        import 'package:flutter_application_1/model/contact.dart';
        import 'package:flutter_bloc/flutter_bloc.dart';
        import 'package:shared_preferences/shared_preferences.dart';

        class ContactBloc extends Bloc<ContactEvent, ContactState> {
        ContactBloc()
            : super(
                ContactState(
                    [
                    Contact(
                        name: 'Yusuf',
                        phoneNumber: '1111',
                    )
                    ],
                ),
                ) {
            on<AddContact>(
            (event, emit) async {
                List<Contact> newList = List.from(state.contacts)
                ..add(
                    Contact(
                    name: event.name,
                    phoneNumber: event.phoneNumber,
                    ),
                );
                SharedPreferences prefs = await SharedPreferences.getInstance();
                final String dataContact = Contact.encode(newList);
                await prefs.setString('contactBloc', dataContact);
                emit(ContactState(newList));
            },
            );
            on<GetContact>((event, emit) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final String? contactString = prefs.getString('contactBloc');
            List<Contact> data = Contact.decode(contactString!);
            emit(ContactState(data));
            });
        }
        }
        ```

2.  Hasil
