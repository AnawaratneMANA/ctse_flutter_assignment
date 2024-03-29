import 'package:ctse_assignment_1/components/profile/background.dart';
import 'package:ctse_assignment_1/models/user.dart';
import 'package:ctse_assignment_1/screens/edit_user_form.dart';
import 'package:ctse_assignment_1/screens/leader_board.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:ctse_assignment_1/screens/quize_list.dart';
import 'package:ctse_assignment_1/screens/user_history.dart';
import 'package:ctse_assignment_1/util/User/UserCRUDModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/userAuth/userauthentication.dart';
import 'movie_library_list.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  String uid = '';
  List<Users> docs = [];
  String correctCount = '';
  String wrongCount = '';
  String noQuestionCount = '';
  String name = '';
  String email = '';
  String age = '';
  String count1 = '';
  String highestScore = '';
  Stream<List<Users>>? listUser;

  //Stream<Object>? count;
  int count = 0;

  @override
  void initState() {
    super.initState();
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false)
        .authStateChanges;

    val.listen((event) {
      // print(event?.uid);
      setState(() {
        uid = event!.uid.toString();
        print('user ud $uid');
        Provider.of<UserCRUDModel>(context, listen: false)
            .getLoginUser(event!.uid.toString())
            .then((value) => {
                  //print(value),
                print('user ud $value'),
                  setState(() {
                    docs = value;
                    name = docs[0].userName.toString();
                    age = docs[0].age.toString();
                    email = docs[0].email.toString();
                  }),
                });
       // listUser = Provider.of<UserCRUDModel>(context).getUserDetails(event!.uid.toString());
        Provider.of<UserCRUDModel>(context, listen: false)
            .getCorrectAnswers(event!.uid.toString())
            .then((value) => {
                  //print(value),
                  setState(() {
                    if(value.toString() == "null"){
                      correctCount = '0';
                    } else{
                      correctCount = value.toString();
                    }

                    // print('correctCount');
                    // print(correctCount);
                  }),
                });
        Provider.of<UserCRUDModel>(context, listen: false)
            .getTotal(event!.uid.toString())
            .then((value) => {
          print(value),
          setState(() {
            count1 = value.toString();
            print('check 11');
            print(count1);
            // if(value.toString() == "null"){
            //   correctCount = '0';
            // } else{
            //   correctCount = value.toString();
            // }

            // print('correctCount');
            // print(correctCount);
          }),
        });



        Provider.of<UserCRUDModel>(context, listen: false)
            .getWrongAnswers(event!.uid.toString())
            .then((value) => {
                  //print(value),
                  setState(() {
                    if(value.toString() == "null"){
                      wrongCount = '0';
                    } else{
                      wrongCount = value.toString();
                    }
                    // print('wrongCount');
                    // print(wrongCount);
                  }),
                });
        Provider.of<UserCRUDModel>(context, listen: false)
            .getNoOfQuestions(event!.uid.toString())
            .then((value) => {
                  print('error occured'),
                  print(value),
                  setState(() {
                    if(value.toString() == "null"){
                      noQuestionCount = '0';
                    } else {
                      noQuestionCount = value.toString();
                    }
                    // print('wrongCount');
                    // print(wrongCount);
                  }),
                });
        Provider.of<UserCRUDModel>(context, listen: false)
            .getHighestScore(event!.uid.toString())
            .then((value) => {
                  //print(value),
                  setState(() {
                    if(value.toString() == "null"){
                      highestScore = '0';
                    } else{
                      highestScore = value.toString();
                    }
                    // print('wrongCount');
                    // print(wrongCount);
                  }),
                });
        // count = Provider.of<UserCRUDModel>(context, listen: false)
        //     .getWrongAnswers1(event!.uid.toString());
      });
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    String? valueText;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(docs[0].email.toString()),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              decoration: InputDecoration(hintText: "Enter Your Password Here"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  Provider.of<UserAuthentication>(context, listen: false).logInUser(docs[0].email.toString(), valueText!);
                  Stream<User?> val1 = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;
                  val1.listen((event) {
                    Provider.of<UserAuthentication>(context, listen: false).deleteUserAccount();
                  });
                },
              ),

            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   //String Age = docs[0].age.toString();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 75,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/profile-user.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text('Age - $age'
                  ,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                // StreamBuilder<List<Users>>(
                //     stream: null,
                //     builder: (context, snapshot) {
                //      // final usersList = snapshot.requireData;
                //       return Text(
                //         docs[0].userName.toString(),
                //         style: TextStyle(fontSize: 16, color: Colors.white),
                //       );
                //     }),
                // StreamBuilder<List<Users>>(
                //     stream: null,
                //   builder: (context, snapshot) {
                //     //final usersList = snapshot.requireData;
                //     return Text(
                //       docs[0].email.toString(),
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     );
                //   }
                // ),
                // StreamBuilder<List<Users>>(
                //     stream: null,
                //   builder: (context, snapshot) {
                //     //final usersList = snapshot.requireData;
                //     return Text(
                //       docs[0].age.toString(),
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     );
                //   }
                // ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Game Statistics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    width: size.width,
                    //height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "High Score",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              highestScore,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Quizes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              noQuestionCount,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Correct",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(correctCount,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.yellow)),

                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Wrong",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              wrongCount,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profile Configurations',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    //color:
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(255, 15, 223, 232),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 30,
                      runSpacing: 10,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaderBoard()),
                            );
                          },
                          child: const Text(
                            'Leaderboard',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUserForm()),
                            );
                          },
                          child: const Text(
                            'Edit User',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DropDown()),
                            );
                          },
                          child: const Text(
                            'Quiz configuration',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserHistory(
                                    id: uid,
                                  )),
                            );
                          },
                          child: const Text(
                            'User History',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800, // background
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => UserHistory(
                            //             id: uid,
                            //           )),
                            // );
                            _displayTextInputDialog(context);

                          },
                          child: const Text(
                            'Delete Account',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(120, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Provider.of<UserAuthentication>(context, listen: false).signoutUser();
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //   context,
                  //           //   MaterialPageRoute(builder: (context) => ProfileUI()),
                  //           // );
                  //         },
                  //         child: const Text(
                  //           'Clear',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => LeaderBoard()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'Leaderboard',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => UserHistory()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'UserHistory',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => DropDown()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'Quiz configuration',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              // Row(
              //   children: [
              //     Column(
              //       children: [
              //         Text(
              //           'Profile Image',
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         Container(
              //           margin: EdgeInsets.all(10.0),
              //           padding: EdgeInsets.all(10.0),
              //           width: size.width * 0.35,
              //           height: 180,
              //           decoration: const BoxDecoration(
              //             color: Colors.lightBlue,
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //           child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color.fromARGB(
              //                           255, 8, 47, 114), // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       // Navigator.push(
              //                       //   context,
              //                       //   MaterialPageRoute(builder: (context) => ProfileUI()),
              //                       // );
              //                     },
              //                     child: const Text(
              //                       'Edit Account',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color.fromARGB(
              //                           255, 8, 47, 114), // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => LibraryList()),
              //                       );
              //                     },
              //                     child: const Text(
              //                       'My Library',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Colors.red, // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       Provider.of<UserAuthentication>(context,
              //                               listen: false)
              //                           .signoutUser();
              //                       // Navigator.push(
              //                       //   context,
              //                       //   MaterialPageRoute(builder: (context) => ProfileUI()),
              //                       // );
              //                     },
              //                     child: const Text(
              //                       'Delete Account',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //               ]),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Text(
              //           'Profile Details',
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         Container(
              //           margin: EdgeInsets.all(10.0),
              //           width: size.width * 0.5,
              //           height: 180,
              //           decoration: const BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //           child: const Text('is working'),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
