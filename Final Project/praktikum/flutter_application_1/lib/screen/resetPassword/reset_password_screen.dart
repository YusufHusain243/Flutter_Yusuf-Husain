import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/resetPassword/reset_password_view_model.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  int id;
  ResetPassword({Key? key, required this.id}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
          centerTitle: true,
          backgroundColor: const Color(0xff646FD4),
        ),
        body: Consumer<ResetPasswordViewModel>(
          builder: (context, value, child) {
            return Form(
              child: Padding(
                key: formKey,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Input New Password",
                        labelText: "New Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
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
                      height: 15,
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
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              content: Text('Reset Password...'),
                            );
                          },
                        );
                        bool result = await value.resetPassword(
                          widget.id,
                          passwordController.text.toString(),
                        );
                        if (result == true) {
                          Navigator.of(context).pop();
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Reset Password Success'),
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
                                title: const Text('Reset Password Gagal'),
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
                      },
                      child: const Text(
                        'Reset Password',
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
    );
  }
}
