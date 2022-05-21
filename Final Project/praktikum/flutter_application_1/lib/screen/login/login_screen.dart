import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/model/users_model.dart';
import 'package:flutter_application_1/screen/home/home_screen.dart';
import 'package:flutter_application_1/screen/login/login_view_model.dart';
import 'package:flutter_application_1/screen/register/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_dialogs/material_dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool cekLogin;
  late int userId;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    cekLogin = loginData.getBool('cekLogin') ?? true;
    userId = loginData.getInt('userId') ?? 0;

    if (cekLogin == true && userId != 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userId: userId,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff9BA3EB),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 65,
                ),
                Image.asset(
                  'assets/logo4.png',
                  scale: 2,
                  key: const Key('logo'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/logo6.png',
                  scale: 2,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 65,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffDBDFFD),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Consumer<LoginViewModel>(
                    builder: (context, value, child) {
                      return Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                key: const Key('email'),
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Input Email",
                                  labelText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email Can't Be Empty!";
                                  }
                                  if (!EmailValidator.validate(value)) {
                                    return "Please enter a valid email!";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Input Password",
                                  labelText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password Can't Be Empty!";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff646FD4),
                                  minimumSize: const Size.fromHeight(55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    Dialogs.materialDialog(
                                      msg: 'Please Wait',
                                      title: "Login...",
                                      color: Colors.white,
                                      context: context,
                                    );
                                    bool result = await value.login(
                                      User(
                                        id: 0,
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                        username: '',
                                      ),
                                    );
                                    if (result == true) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return HomeScreen(
                                              userId: value.user.id,
                                            );
                                          },
                                          transitionsBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            final tween = Tween(
                                              begin: const Offset(0, -1),
                                              end: Offset.zero,
                                            );
                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                      Dialogs.materialDialog(
                                        msg: value.status.toString(),
                                        title: "Success",
                                        color: Colors.white,
                                        context: context,
                                        actions: [
                                          IconsButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            text: 'Close',
                                            iconData: Icons
                                                .check_circle_outline_sharp,
                                            color: Colors.green,
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                        ],
                                      );
                                    }

                                    if (result == false) {
                                      Navigator.of(context).pop();
                                      Dialogs.materialDialog(
                                        msg: value.status.toString(),
                                        title: "Failed",
                                        color: Colors.white,
                                        context: context,
                                        actions: [
                                          IconsButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            text: 'Close',
                                            iconData: Icons.close,
                                            color: Colors.red,
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                        ],
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't Have an Account?",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 68, 255),
                                    ),
                                  ),
                                  TextButton(
                                    key: const Key('register'),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return const RegisterScreen();
                                          },
                                          transitionsBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            final tween = Tween(
                                              begin: const Offset(0, -1),
                                              end: Offset.zero,
                                            );
                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Register!',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 68, 255),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
