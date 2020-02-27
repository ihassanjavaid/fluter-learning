import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text("Quizeria"),
        ), // AppBar
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ), //Padding
        ), // Safe Area
      ), // Scaffold
    ); // Material App
  }

}

//Stateful Widget
class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();

}

class _QuizPageState extends State<QuizPage> {
  
  List<String> questions = [
    'Node.js is a front end language.',
    'MySQL uses relational database.',
    'C# is a higher level language than python.'
  ];

  List<bool> questionAnswers = [false, true, false];
  
  List<Widget> scoreKeeper = [];
  
  int questionNumber = 0;
  
  createAlertDialog(BuildContext context, bool finalAnswer){
    return showDialog(context: context,builder: (context){
      
      if (finalAnswer){
        return AlertDialog(
        title: Text(
          "Hurrah!",
           style: TextStyle(
            color: Colors.green,
            ), // Text Style
        ), // Text
        content: Text(
          "Your answer was right!",
        style: TextStyle(
            color: Colors.green,
            ),
        ),
        elevation: 5.0,
      );
      }
      else{
        return AlertDialog(
        title: Text(
          "Alas!",
           style: TextStyle(
            color: Colors.red,
            ), // Text Style
        ),
        content: Text(
          "Your answer was false!",
           style: TextStyle(
            color: Colors.red,
            ),
        ),
          elevation: 5.0,
      );
      }
    });
  }
  
  void checkAnswer(bool userAnswer, BuildContext context) {
    setState( () {
              
              if (questionNumber < questions.length-1 ) {
              
              if (questionAnswers[questionNumber] == userAnswer){
                scoreKeeper.add(
                  Icon(
                  Icons.check,
                  color: Colors.green,
                  ), // Icon
                );
                createAlertDialog(context, true);
              }
              else {
                scoreKeeper.add(
                  Icon(
                  Icons.close,
                  color: Colors.red,
                  ), // Icon
                ); 
                createAlertDialog(context, false);
              }
              
              questionNumber++;
              }
            });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ), // Text Style
             ), // Text
            ), //Center
           ), // Padding
        ), // Expanded
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
          child: Text(
            'True',
            style: TextStyle(
            color: Colors.white,
            ), // Text Style
          ), // Text
          color: Colors.green,
          onPressed: () {
            checkAnswer(true, context);
          }, // Void Call Back
        ), // FlatButton
        ), //Padding
        ), //Expanded
            Expanded(
              child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: 
        FlatButton(
          child: Text(
            'False',
            style: TextStyle(
            color: Colors.white,
            ), // Text Style
          ), // Text
          color: Colors.red,
          onPressed: () {
           checkAnswer(false, context);
          }, // Void Call Back
          ), //Flat Button
        ), // 
        ), // Expanded
        ], // Widget
        ), // Row
        Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
        ), //Row
      ], // Widget[]
    ); //Column
  }
}