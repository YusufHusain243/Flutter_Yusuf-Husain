import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/projects_model.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_screen.dart';
import 'package:flutter_application_1/screen/home/home_view_model.dart';
import 'package:flutter_application_1/screen/home/home_view_state.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:flutter_application_1/screen/resetPassword/reset_password_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  int userId;
  HomeScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formKeyCreate = GlobalKey<FormState>();
  var nameProjectController = TextEditingController();
  var codeProjectController = TextEditingController();

  var formKeyJoin = GlobalKey<FormState>();
  var joinCodeController = TextEditingController();

  late SharedPreferences loginData;
  late bool cekLogin;

  @override
  void dispose() {
    nameProjectController.dispose();
    codeProjectController.dispose();
    joinCodeController.dispose();
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
      var viewModel = Provider.of<HomeViewModel>(context, listen: false);
      await viewModel.getProjects(widget.userId);
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
                                return ResetPassword(id: widget.userId);
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
                          //         ResetPassword(id: widget.user.id),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          // );
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
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              color: const Color.fromARGB(255, 59, 99, 128),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Team Works\nApplication',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset(
                        'assets/logo.png',
                        scale: 9,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
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
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'New Project',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Consumer<HomeViewModel>(
                                        builder: (build, value, child) {
                                          return TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              if (formKeyCreate.currentState!
                                                  .validate()) {
                                                await value.createProject(
                                                  Project(
                                                    id: 0,
                                                    userId: widget.userId,
                                                    nameProject:
                                                        nameProjectController
                                                            .text
                                                            .toString(),
                                                    codeProject:
                                                        codeProjectController
                                                            .text
                                                            .toString(),
                                                  ),
                                                );

                                                if (value.state ==
                                                    HomeViewState.success) {
                                                  nameProjectController.clear();
                                                  codeProjectController.clear();
                                                  value.getProjects(
                                                      widget.userId);
                                                }
                                              }
                                            },
                                            child: const Text(
                                              'Create',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Form(
                                    key: formKeyCreate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: nameProjectController,
                                            decoration: InputDecoration(
                                              hintText: "Input Project Name",
                                              labelText: "Project Name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Project Name Can't Be Empty!";
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: codeProjectController,
                                            decoration: InputDecoration(
                                              hintText: "Input Code Project",
                                              labelText: "Code Project",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Code Project Can't Be Empty";
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
                        child: const Text('Create New'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Join Project'),
                              content: Form(
                                key: formKeyJoin,
                                child: TextFormField(
                                  controller: joinCodeController,
                                  decoration: InputDecoration(
                                    hintText: "Input Code Project",
                                    labelText: "Code Project",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Code Project Can't Be Empty!";
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
                                Consumer<HomeViewModel>(
                                  builder: (build, value, child) {
                                    return TextButton(
                                      onPressed: () async {
                                        if (formKeyJoin.currentState!
                                            .validate()) {
                                          Navigator.of(context).pop();
                                          await value.joinProject(
                                            joinCodeController.text,
                                            widget.userId,
                                          );

                                          if (value.state ==
                                              HomeViewState.success) {
                                            value.getProjects(widget.userId);
                                          }
                                        }
                                      },
                                      child: const Text('Join'),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Join Project'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  if (value.state == HomeViewState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (value.state == HomeViewState.success) {
                    return ListView.separated(
                      itemCount: value.projects.length,
                      itemBuilder: (context, index) {
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
                                            await value.deleteProject(
                                              value.projects[index].id,
                                            );

                                            if (value.state ==
                                                HomeViewState.success) {
                                              value.getProjects(widget.userId);
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
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: value.projects[index].codeProject
                                          .toString(),
                                    ),
                                  ).then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Code project copied to clipboard",
                                        ),
                                      ),
                                    );
                                  });
                                },
                                backgroundColor:
                                    const Color.fromRGBO(143, 143, 143, 1),
                                foregroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                icon: Icons.copy,
                                label: 'Copy',
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailProjectScreen(
                                      idProject: value.projects[index].id,
                                      userId: widget.userId,
                                      nameProject:
                                          value.projects[index].nameProject,
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
                              //     builder: (context) => DetailProjectScreen(
                              //       idProject: value.projects[index].id,
                              //       idUser: widget.user.id,
                              //       nameProject:
                              //           value.projects[index].nameProject,
                              //     ),
                              //   ),
                              // );
                            },
                            selected: true,
                            selectedTileColor:
                                const Color.fromARGB(255, 243, 243, 243),
                            shape: const Border(bottom: BorderSide(width: 1)),
                            title: Text(
                              value.projects[index].nameProject.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            visualDensity: const VisualDensity(vertical: 4),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                    );
                  }

                  return const Center(
                    child: Text('Get Data Failed!'),
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
