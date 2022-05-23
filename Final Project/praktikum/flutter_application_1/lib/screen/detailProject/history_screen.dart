import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_model.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_state.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  int itemProjectId;
  HistoryScreen({Key? key, required this.itemProjectId}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late SharedPreferences loginData;
  late bool cekLogin;

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    cekLogin = loginData.getBool('cekLogin')!;

    if (cekLogin == false) {
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
      await viewModel.getHistory(widget.itemProjectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          centerTitle: true,
          backgroundColor: const Color(0xff646FD4),
        ),
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       Container(
        //         alignment: Alignment.centerLeft,
        //         color: const Color(0xff646FD4),
        //         width: double.infinity,
        //         padding: const EdgeInsets.only(
        //           top: 40,
        //           left: 20,
        //           bottom: 40,
        //         ),
        //         child: Row(
        //           children: [
        //             Image.asset(
        //               'assets/logo3.png',
        //               scale: 2.5,
        //               color: Colors.white,
        //             ),
        //             const SizedBox(
        //               width: 15,
        //             ),
        //             Image.asset(
        //               'assets/logo6.png',
        //               scale: 2.5,
        //               color: Colors.white,
        //             ),
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //         child: Container(
        //           width: double.infinity,
        //           color: Colors.white,
        //           child: ListView(
        //             children: [
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               ListTile(
        //                 onTap: () {
        //                   Navigator.of(context).push(
        //                     PageRouteBuilder(
        //                       pageBuilder:
        //                           (context, animation, secondaryAnimation) {
        //                         return ResetPassword(
        //                           id: widget.userId,
        //                         );
        //                       },
        //                       transitionsBuilder: (
        //                         context,
        //                         animation,
        //                         secondaryAnimation,
        //                         child,
        //                       ) {
        //                         final tween = Tween(
        //                           begin: const Offset(0, -1),
        //                           end: Offset.zero,
        //                         );
        //                         return SlideTransition(
        //                           position: animation.drive(tween),
        //                           child: child,
        //                         );
        //                       },
        //                     ),
        //                   );
        //                 },
        //                 iconColor: Colors.black,
        //                 textColor: Colors.black,
        //                 leading: const Icon(
        //                   Icons.lock_reset,
        //                   size: 30,
        //                 ),
        //                 title: const Text(
        //                   'Reset Password',
        //                   style: TextStyle(
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ),
        //               ListTile(
        //                 onTap: () {
        //                   loginData.remove('userId');
        //                   loginData.remove('ccekLogin');
        //                   Navigator.of(context).push(
        //                     PageRouteBuilder(
        //                       pageBuilder:
        //                           (context, animation, secondaryAnimation) {
        //                         return const LoginScreen();
        //                       },
        //                       transitionsBuilder: (
        //                         context,
        //                         animation,
        //                         secondaryAnimation,
        //                         child,
        //                       ) {
        //                         final tween = Tween(
        //                           begin: const Offset(0, -1),
        //                           end: Offset.zero,
        //                         );
        //                         return SlideTransition(
        //                           position: animation.drive(tween),
        //                           child: child,
        //                         );
        //                       },
        //                     ),
        //                   );
        //                 },
        //                 iconColor: Colors.black,
        //                 textColor: Colors.black,
        //                 leading: const Icon(
        //                   Icons.logout,
        //                   size: 27,
        //                 ),
        //                 title: const Text(
        //                   'Logout',
        //                   style: TextStyle(
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: Container(
          color: const Color.fromARGB(255, 243, 243, 243),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Consumer<DetailProjectViewModel>(
              builder: (build, value, child) {
                if (value.state == DetailProjectViewState.loading) {
                  return Container(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (value.state == DetailProjectViewState.error) {
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
                }

                return RefreshIndicator(
                  onRefresh: refreshData,
                  child: ListView.builder(
                    itemCount: value.history.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.history[index].createdAt
                                  .substring(0, 10)),
                              Text(value.history[index].name),
                              const SizedBox(
                                height: 5,
                              ),
                              value.history[index].status.toString() == 'true'
                                  ? Badge(
                                      toAnimate: true,
                                      shape: BadgeShape.square,
                                      badgeColor: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                      badgeContent: Text(
                                        value.history[index].status.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Badge(
                                      toAnimate: true,
                                      shape: BadgeShape.square,
                                      badgeColor: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      badgeContent: Text(
                                        value.history[index].status.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future refreshData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel =
          Provider.of<DetailProjectViewModel>(context, listen: false);
      await viewModel.getHistory(widget.itemProjectId);
    });
  }
}
