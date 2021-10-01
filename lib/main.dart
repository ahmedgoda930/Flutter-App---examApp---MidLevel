import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'AppData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Padding(
        padding: EdgeInsets.all(5),
        child: MyHomePage(title: 'Exam'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> answers = [];
  int rightanswers = 0;
  int falseanswers = 0;
  var app = AppData();
  void setAnswer(bool? whatUserPicked) {
    var txt = 'Your Right answers = ${rightanswers.toString()}' +
        'and your false answers = ${app.getQuestionLength() - rightanswers}';
    bool? correctanswer = app.getQuestion().answ;
    setState(() {
      if (whatUserPicked == correctanswer) {
        rightanswers++;
        this.answers.add(
              Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.red,
                ),
              ),
            );
      } else {
        this.answers.add(
              Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                ),
              ),
            );
      }

      if (app.isFinished() == true) {
        Alert(
          context: context,
          title: "Compeleted",
          desc: txt,
          buttons: [
            DialogButton(
              child: Text(
                'Start New',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
                rightanswers = 0;
              },
            ),
          ],
        ).show();
        app.reset();
        answers = [];
      } else
        app.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: answers,
          ),
          Expanded(
            flex: 5, //5 اضعاف الذر
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Image.asset(app.getQuestion().txtImage.toString()),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  app.getQuestion().txt.toString(),
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  setAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[600]),
                ),
                onPressed: () {
                  setAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
