import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_model.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_state.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:flutter_application_1/screen/resetPassword/reset_password_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProjectScreen extends StatefulWidget {
  int idProject;
  String nameProject;
  int userId;
  DetailProjectScreen(
      {Key? key,
      required this.idProject,
      required this.userId,
      required this.nameProject})
      : super(key: key);

  @override
  State<DetailProjectScreen> createState() => _DetailProjectScreenState();
}

class _DetailProjectScreenState extends State<DetailProjectScreen> {
  var formKey = GlobalKey<FormState>();
  var itemProjectController = TextEditingController();

  late SharedPreferences loginData;
  late bool cekLogin;

  @override
  void dispose() {
    itemProjectController.dispose();
    super.dispose();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    widget.userId = loginData.getInt('userId')!;
    cekLogin = loginData.getBool('cekLogin')!;

    if (cekLogin == false && widget.userId == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initial();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel =
          Provider.of<DetailProjectViewModel>(context, listen: false);
      await viewModel.getDetailProjects(widget.idProject);
    });
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
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 55, 129, 182),
                padding: const EdgeInsets.all(40),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 59, 99, 128),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return ResetPassword(
                                  id: widget.userId,
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
                          //     builder: (context) => ResetPassword(
                          //       id: widget.idUser,
                          //     ),
                          //   ),
                          // );
                        },
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.restore,
                          size: 30,
                        ),
                        title: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          loginData.remove('userId');
                          loginData.remove('ccekLogin');
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const LoginScreen();
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
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.logout,
                          size: 27,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 50,
                left: 30,
                right: 30,
              ),
              width: double.infinity,
              color: const Color.fromARGB(255, 59, 99, 128),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        scale: 7,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.nameProject.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 5,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  // Column(
                  //   children: [

                  // Text(
                  //   widget.nameProject.toString(),
                  // style: const TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 25,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  //   textAlign: TextAlign.center,
                  // ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DetailProjectViewModel>(
                builder: (build, value, child) {
                  if (value.state == DetailProjectViewState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (value.state == DetailProjectViewState.error) {
                    return const Center(
                      child: Text('Get Data Failed'),
                    );
                  }

                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ListView.builder(
                        itemCount: value.detailProjects.length,
                        itemBuilder: (context, index) {
                          // return Text(value.detailProjects[index].name);
                          return Slidable(
                            closeOnScroll: true,
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (BuildContext context) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Delete Project'),
                                        content: const Text('Are you sure?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              bool result = await value
                                                  .deleteDetailProject(
                                                value.detailProjects[index].id,
                                              );

                                              if (result == true) {
                                                value.getDetailProjects(
                                                    widget.idProject);
                                              }
                                            },
                                            child: const Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  backgroundColor:
                                      const Color.fromRGBO(255, 0, 0, 1),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: CheckboxListTile(
                              visualDensity: const VisualDensity(
                                vertical: 2,
                              ),
                              shape: const Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 0, 140, 255),
                                ),
                              ),
                              title: Text(
                                  value.detailProjects[index].name.toString()),
                              value: value.detailProjects[index].status,
                              onChanged: (val) async {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      content: Text('Update Status...'),
                                    );
                                  },
                                );
                                bool result = await value.updateDetailProject(
                                  value.detailProjects[index].id.toInt(),
                                  val!,
                                );
                                if (result = true) {
                                  Navigator.of(context).pop();
                                  value.getDetailProjects(widget.idProject);
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Update Success'),
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
                                } else {
                                  Navigator.of(context).pop();
                                  value.getDetailProjects(widget.idProject);
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Update Failed'),
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
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 99, 128),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Item Project'),
                                content: Form(
                                  key: formKey,
                                  child: TextFormField(
                                    controller: itemProjectController,
                                    decoration: InputDecoration(
                                      hintText: "Input Item Project",
                                      labelText: "Item Project",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Item Project Can't Be Empty!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      if (formKey.currentState!.validate()) {
                                        await value.addDetailProject(
                                          DetailProject(
                                            id: 0,
                                            projectId: widget.idProject,
                                            name: itemProjectController.text
                                                .toString(),
                                            status: false,
                                          ),
                                        );

                                        if (value.state ==
                                            DetailProjectViewState.success) {
                                          itemProjectController.clear();
                                          value.getDetailProjects(
                                              widget.idProject);
                                        }
                                      }
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
