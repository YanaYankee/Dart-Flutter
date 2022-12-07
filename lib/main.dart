import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final _questions = const [
        {
          'questionText' : 'What\s your favourite color?',
        'answers' : [
          {'text': 'Black',
          'score' : 10 }, 
          {'text': 'Red',
          'score' : 5 }, 
          {'text': 'Green',
          'score' : 3 }, 
          {'text': 'Yellow',
          'score' : 1 }, 
         ],
        },
        {
          'questionText' : 'What\s your favourite animal?',
        'answers' : [
          {'text': 'Snake',
          'score' : 10 }, 
          {'text': 'Lion',
          'score' : 5 }, 
          {'text': 'Elepant',
          'score' : 3 }, 
          {'text': 'Rabbit',
          'score' : 1 }, 
          ],
        },
        {
          'questionText' : 'What\s your favourite instractor?',
          'answers' : [
            {'text': 'Max',
          'score' : 1 }, 
           {'text': 'Max',
          'score' : 1 }, 
           {'text': 'Max',
          'score' : 1 }, 
           {'text': 'Max',
          'score' : 1 }, 
          ]
        },
      ];

    var _questionIndex = 0;
    var _totalScore = 0;

    void _resetQuiz(){
      setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      }); 
      
    }

  
  void _answerQuestion(int score){

    _totalScore += score;

    setState(() {
       _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length ){
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
        body: _questionIndex < _questions.length 
        ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex, 
          questions: _questions)
        : Result(_totalScore, _resetQuiz), 
        ),
      ); //instead of Text('Hello!'));
  }
}