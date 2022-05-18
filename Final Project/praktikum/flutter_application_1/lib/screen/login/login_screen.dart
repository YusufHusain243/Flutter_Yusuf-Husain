import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/model/users_model.dart';
import 'package:flutter_application_1/screen/home/home_screen.dart';
import 'package:flutter_application_1/screen/login/login_view_model.dart';
import 'package:flutter_application_1/screen/register/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        appBar: AppBar(
          title: const Text('Team Works Application'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 59, 99, 128),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<LoginViewModel>(
                builder: (context, value, child) {
                  return Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Input Email",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
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
                              hintText: "Input Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Can't Be Empty!";
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              const Text("Don't Have an Account?"),
                              TextButton(
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const RegisterScreen(),
                                  //   ),
                                  // );
                                },
                                child: const Text(
                                  'Register!',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 59, 99, 128),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 59, 99, 128),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      content: Text('Login...'),
                                    );
                                  },
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => HomeScreen(
                                  //       user: value.user,
                                  //     ),
                                  //   ),
                                  // );
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(value.status.toString()),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                if (result == false) {
                                  Navigator.of(context).pop();
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(value.status.toString()),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
