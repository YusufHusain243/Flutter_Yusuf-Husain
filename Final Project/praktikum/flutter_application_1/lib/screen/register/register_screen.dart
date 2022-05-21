import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/model/users_model.dart';
import 'package:flutter_application_1/screen/register/register_view_model.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
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
                  child: Consumer<RegisterViewModel>(
                    builder: (context, value, child) {
                      return Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Input Username",
                                  labelText: "Username",
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
                                    return "Username Can't Be Empty!";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
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
                                      title: "Registering...",
                                      color: Colors.white,
                                      context: context,
                                    );
                                    bool result = await value.register(
                                      User(
                                        id: 1,
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                        username:
                                            usernameController.text.toString(),
                                      ),
                                    );

                                    if (result == true) {
                                      Navigator.of(context).pop();
                                      Navigator.pop(context);
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Success"),
                                            content: const Text(
                                              "Registration Success!",
                                            ),
                                            actions: <Widget>[
                                              IconsButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                text: 'Close',
                                                iconData: Icons
                                                    .check_circle_outline_sharp,
                                                color: Colors.green,
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                                iconColor: Colors.white,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (result == false) {
                                      Navigator.of(context).pop();
                                      Dialogs.materialDialog(
                                        msg: "Registration Failed!",
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
                                              color: Colors.white,
                                            ),
                                            iconColor: Colors.white,
                                          ),
                                        ],
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20),
                                ),
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
