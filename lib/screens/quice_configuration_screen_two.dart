
import 'package:flutter/material.dart';

import '../components/form_dropdown/ExpandedListAnimationWidget.dart';
import '../components/form_dropdown/Scrollbar.dart';

class DropDownNew extends StatefulWidget {

  String? category, id;
  int? time, questions;

  DropDownNew(
      {Key? key,
        required this.id,
        required this.category,
        required this.time,
        required this.questions,
      })
      : super(key: key);

  // const DropDownNew({Key? key}) : super(key: key);

  @override
  _DropDownNewState createState() => _DropDownNewState();
}
List <String> _list =['Action',"Romance","Thriller",'Animation', "Comedy"];
List <String> _list2 =['5',"10","15",'20'];
List <String> _list3 =['10',"15","20", "30"];

class _DropDownNewState extends State<DropDownNew> {
  bool isStrechedDropDown = false;
  bool isStrechedDropDown2 = false;
  bool isStrechedDropDown3 = false;

  // int? groupValue;
  // int? groupValue2;
  // int? groupValue3;

  String title = 'Select Movie Category';
  String title2 = 'Select No of questions';
  String title3 = 'Select time';

  String? category, id;
  int? questions, time;


  void onPress () {
    // Provider.of<QuizListCrudModel>(context, listen: false).insertQuizListData(category, questions, time)
    //     .then((value) {
    //   //Provider.of<QuizCrudModel>(context, listen: false).saveQuizID(value.toString()).;
    //   print(value);
    //   if(value != 0){
    //     Alert(
    //       context: context,
    //       title: "Successfully",
    //       desc: "You have Successfully Submitted the Data",
    //     ).show();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/p4.jpg"),
                      fit: BoxFit.fill,
                      // colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0), BlendMode.darken)
                    )
                ),
              ),
            ),

            title: Text(
              "Quice Configuration",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
            ),
          ),
          // title: Text(
          //   "Quiz Configuration",
          //   style: TextStyle(color: Colors.black),
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    // color: Colors.lightGreenAccent,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                          child: Text(
                            "Enter Movie Category",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff1a237e)),
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                  child: Column(
                                    children: [
                                      Container(
                                        // height: 45,
                                          width: double.infinity,
                                          padding: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xff1a237e),
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                          constraints: BoxConstraints(
                                            minHeight: 45,
                                            minWidth: double.infinity,
                                          ),
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 20, vertical: 10),
                                                  child:
                                                  Text(
                                                    title,
                                                    style: TextStyle(color: Colors.black45),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isStrechedDropDown =
                                                      !isStrechedDropDown;
                                                    });
                                                  },
                                                  child: Icon(isStrechedDropDown
                                                      ? Icons.arrow_upward
                                                      : Icons.arrow_downward))
                                            ],
                                          )),
                                      ExpandedSection(
                                        expand: isStrechedDropDown,
                                        height: 100,
                                        child: MyScrollbar(
                                          builder: (context, scrollController2) =>
                                              ListView.builder(
                                                  padding: EdgeInsets.all(0),
                                                  controller: scrollController2,
                                                  shrinkWrap: true,
                                                  itemCount: _list.length,
                                                  itemBuilder: (context, index) {
                                                    return RadioListTile(
                                                        title: Text(_list.elementAt(index)),
                                                        value: index,
                                                        groupValue: category,
                                                        onChanged: (val) {
                                                          if (val == 0) {
                                                            setState(() {
                                                              category =
                                                              'Action';
                                                              title = _list.elementAt(index);
                                                            });
                                                          } else if (val == 1) {
                                                            setState(() {
                                                              category =
                                                              'Romance';
                                                              title = _list.elementAt(index);
                                                            });
                                                          }
                                                          else if (val == 2) {
                                                            setState(() {
                                                              category =
                                                              'Thriller';
                                                              title = _list.elementAt(index);
                                                            });
                                                          }
                                                          else if (val == 3) {
                                                            setState(() {
                                                              category =
                                                              'Animation';
                                                              title = _list.elementAt(index);
                                                            });
                                                          }
                                                          else if (val == 4) {
                                                            setState(() {
                                                              category =
                                                              'Comedy';
                                                              title = _list.elementAt(index);
                                                            });
                                                          }
                                                        }
                                                      // onChanged: (val) {
                                                      //   setState(() {
                                                      //     category = val as String?;
                                                      //     title = _list.elementAt(index);
                                                      //   });
                                                      // }
                                                    );
                                                  }),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                        child: Text(
                          "Enter no of questions",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff1a237e)),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 45,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff1a237e),
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        constraints: BoxConstraints(
                                          minHeight: 45,
                                          minWidth: double.infinity,
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                child: Text(
                                                  title2,
                                                  style: TextStyle(color: Colors.black45),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isStrechedDropDown2 =
                                                    !isStrechedDropDown2;
                                                  });
                                                },
                                                child: Icon(isStrechedDropDown2
                                                    ? Icons.arrow_upward
                                                    : Icons.arrow_downward))
                                          ],
                                        )),
                                    ExpandedSection(
                                      expand: isStrechedDropDown2,
                                      height: 100,
                                      child: MyScrollbar(
                                        builder: (context, scrollController2) =>
                                            ListView.builder(
                                                padding: EdgeInsets.all(0),
                                                controller: scrollController2,
                                                shrinkWrap: true,
                                                itemCount: _list2.length,
                                                itemBuilder: (context, index) {
                                                  return RadioListTile(
                                                      title: Text(_list2.elementAt(index)),
                                                      value: index,
                                                      groupValue: questions,
                                                      onChanged: (val) {
                                                        if (val == 0) {
                                                          setState(() {
                                                            questions =
                                                            5;
                                                            title2 = _list2.elementAt(index);
                                                          });
                                                        } else if (val == 1) {
                                                          setState(() {
                                                            questions =
                                                            10;
                                                            title2 = _list2.elementAt(index);
                                                          });
                                                        }
                                                        else if (val == 2) {
                                                          setState(() {
                                                            questions =
                                                            15;
                                                            title2 = _list2.elementAt(index);
                                                          });
                                                        }
                                                        else if (val == 3) {
                                                          setState(() {
                                                            questions =
                                                            20;
                                                            title2 = _list2.elementAt(index);
                                                          });
                                                        }
                                                      }
                                                    // onChanged: (val) {
                                                    //   setState(() {
                                                    //     questions = val as int;
                                                    //     title2 = _list2.elementAt(index);
                                                    //   });
                                                    // }
                                                  );
                                                }),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                        child: Text(
                          "Enter Time",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff1a237e)),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 45,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff1a237e),
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        constraints: BoxConstraints(
                                          minHeight: 45,
                                          minWidth: double.infinity,
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                child: Text(
                                                  title3,
                                                  style: TextStyle(color: Colors.black45),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isStrechedDropDown3 =
                                                    !isStrechedDropDown3;
                                                  });
                                                },
                                                child: Icon(isStrechedDropDown3
                                                    ? Icons.arrow_upward
                                                    : Icons.arrow_downward))
                                          ],
                                        )),
                                    ExpandedSection(
                                      expand: isStrechedDropDown3,
                                      height: 100,
                                      child: MyScrollbar(
                                        builder: (context, scrollController3) =>
                                            ListView.builder(
                                                padding: EdgeInsets.all(0),
                                                controller: scrollController3,
                                                shrinkWrap: true,
                                                itemCount: _list3.length,
                                                itemBuilder: (context, index) {
                                                  return RadioListTile(
                                                      title: Text(_list3.elementAt(index)),
                                                      value: index,
                                                      groupValue: time,
                                                      onChanged: (val) {
                                                        if (val == 0) {
                                                          setState(() {
                                                            time =
                                                            10;
                                                            title3 = _list3.elementAt(index);
                                                          });
                                                        } else if (val == 1) {
                                                          setState(() {
                                                            time =
                                                            15;
                                                            title3 = _list3.elementAt(index);
                                                          });
                                                        }
                                                        else if (val == 2) {
                                                          setState(() {
                                                            time =
                                                            20;
                                                            title3 = _list3.elementAt(index);
                                                          });
                                                        }
                                                        else if (val == 3) {
                                                          setState(() {
                                                            time =
                                                            30;
                                                            title3 = _list3.elementAt(index);
                                                          });
                                                        }
                                                      }


                                                    // onChanged: (val) {
                                                    //   setState(() {
                                                    //     time = val as int;
                                                    //     title3 = _list3.elementAt(index);
                                                    //   });
                                                    // }
                                                  );
                                                }),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(90, 45),
                            textStyle: TextStyle(fontSize: 15),
                            primary: Colors.pink,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Update'),
                          onPressed: onPress),
                      // onPressed: (){
                      //   Navigator.push(
                      //       context, MaterialPageRoute(builder: (context) => QuizeList()));
                      // }
                      SizedBox(height: 20),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       minimumSize: Size(105, 45),
                      //       textStyle: TextStyle(fontSize: 15),
                      //       primary: Colors.pink,
                      //       shape: new RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(10.0),
                      //       ),
                      //     ),
                      //     child: Text('Delete'),
                      //     onPressed: (){
                      //       // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ExampleList(title: 'Exaple List',)));
                      //   }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}