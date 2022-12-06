import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final questions = const [
        {
          'questionText' : 'What\s your favourite color?',
        'answers' : ['Black', 'Red', 'Green', 'Yellow'],
        },
        {
          'questionText' : 'What\s your favourite animal?',
        'answers' : ['Rabbit', 'Snake', 'Elepant', 'Lion'],
        },
        {
          'questionText' : 'What\s your favourite instractor?',
        'answers' : ['Max', 'Max', 'Max', 'Max'],
        },
      ];

  var _questionIndex = 0;
  
  void _answerQuestion(){
    setState(() {
       _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < questions.length ){
      print('We have more questions');
    }
  }

  @override // shows that the extended method is overriden deliberately
  Widget build(BuildContext context){
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < questions.length ?Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
              ),
              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer); // spread operator 
              }).toList()
          ],
        ) : Center(
          child: Text('You did it!'),
        ),
        ),
      ); //instead of Text('Hello!'));
  }
}