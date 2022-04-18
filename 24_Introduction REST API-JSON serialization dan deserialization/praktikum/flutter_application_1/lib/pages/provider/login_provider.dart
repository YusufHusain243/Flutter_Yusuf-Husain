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