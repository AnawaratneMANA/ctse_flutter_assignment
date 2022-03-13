import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/QuestionController.dart';
import '../../models/quiz.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  final int index;

  const QuestionCard({Key? key, required this.question, required this.index})
      : super(key: key);
  // const QuestionCard({Key? key, required this.index}) : super(key: key);

  final Question question;

  final String image = 'assets/images/movie1.jpg';
  //comment

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    print('ttiiiee');
    //print(question);

    // onPress(Question question, int selectedIndex, String? questionID) {
    //   print(question.answer);
    //   print(selectedIndex + 1);
    //   print(questionID);
    //   _controller.checkAns(question, selectedIndex);
    // }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(196, 151, 151, 163),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                  text: "${QuizList[index].id}",
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                      text: "/10",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ]),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                //movieList[index].title.toString()
                QuizList[index].question.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                if (QuizList[index].imageUri != "") ...[
                  Image.network(
                    QuizList[index].imageUri.toString(),
                    height: 170,
                    width: 150,
                  ),
                ] else ...[
                  SizedBox(
                    height: 2,
                  ),
                ],
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index1) => Options(
                            index: index1,
                            text: QuizList[index].options![index1],
                            // press: () =>
                            //     onPress(question, index1, QuizList[index].id),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
