import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/projects_model.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_screen.dart';
import 'package:flutter_application_1/screen/home/home_view_model.dart';
import 'package:flutter_application_1/screen/home/home_view_state.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:flutter_application_1/screen/resetPassword/reset_password_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
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
          title: Image.asset(
            'assets/logo6.png',
            scale: 2.5,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff646FD4),
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                color: const Color(0xff646FD4),
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                  bottom: 40,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo3.png',
                      scale: 2.5,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/logo6.png',
                      scale: 2.5,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
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
                        },
                        iconColor: const Color.fromARGB(255, 0, 0, 0),
                        textColor: const Color.fromARGB(255, 0, 0, 0),
                        leading: const Icon(
                          Icons.lock_reset,
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
                          loginData.remove('name');
                          loginData.remove('cekLogin');
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
                        iconColor: const Color.fromARGB(255, 2, 0, 0),
                        textColor: const Color.fromARGB(255, 0, 0, 0),
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
                top: 45,
                bottom: 45,
                left: 30,
                right: 30,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 180, 189, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo5.png',
                    scale: 3,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff646FD4),
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
                                                    statusProject:
                                                        "On Progress",
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
                          primary: const Color(0xff646FD4),
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
                    return Container(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (value.state == HomeViewState.success) {
                    return RefreshIndicator(
                      onRefresh: refreshData,
                      child: Container(
                        color: const Color.fromARGB(255, 243, 243, 243),
                        child: ListView.builder(
                          itemCount: value.projects.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Slidable(
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
                                            content:
                                                const Text('Are you sure?'),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  IconsButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    text: 'Cancel',
                                                    iconData: Icons.close,
                                                    color: Colors.grey,
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    iconColor: Colors.white,
                                                  ),
                                                  IconsButton(
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop();
                                                      await value.deleteProject(
                                                        value
                                                            .projects[index].id,
                                                      );

                                                      if (value.state ==
                                                          HomeViewState
                                                              .success) {
                                                        value.getProjects(
                                                            widget.userId);
                                                      }
                                                    },
                                                    text: 'Delete',
                                                    iconData: Icons.delete,
                                                    color: Colors.red,
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    iconColor: Colors.white,
                                                  ),
                                                ],
                                              )
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
                                            text: value
                                                .projects[index].codeProject
                                                .toString(),
                                          ),
                                        ).then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Code project copied to clipboard",
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                      backgroundColor: const Color.fromRGBO(
                                          143, 143, 143, 1),
                                      foregroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      icon: Icons.copy,
                                      label: 'Copy',
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return DetailProjectScreen(
                                            idProject: value.projects[index].id,
                                            userId: widget.userId,
                                            nameProject: value
                                                .projects[index].nameProject,
                                            statusProject: value
                                                .projects[index].statusProject,
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
                                  },
                                  title: Text(
                                    value.projects[index].nameProject
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing: Badge(
                                    toAnimate: true,
                                    shape: BadgeShape.square,
                                    badgeColor: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    badgeContent: Text(
                                      value.projects[index].statusProject,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  visualDensity: const VisualDensity(
                                    vertical: 4,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }

                  return Container(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text('Get Data Failed!'),
                        ),
                        ElevatedButton(
                          onPressed: refreshData,
                          child: const Text('Refresh'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future refreshData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<HomeViewModel>(context, listen: false);
      await viewModel.getProjects(widget.userId);
    });
  }
}
