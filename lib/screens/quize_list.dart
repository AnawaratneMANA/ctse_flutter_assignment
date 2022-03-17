import 'package:flutter/material.dart';

import '../components/list_view/card_view.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}
//
class _QuizeListState extends State<QuizeList> {
  List category = ["Romantic", "Horror","Thriller","Animation","Romantic","Romantic", "Horror","Thriller","Animation","Romantic"];
  List time = ["20min", "10min","20min","15min","20min", "10min","20min", "10min","20min","15min"];

  Widget deleteItems(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      color: Colors.red,
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quize List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                CardView1(index: index, text1 : category[index] , text2: time[index]),
        ),
      ),

    );
  }
}
