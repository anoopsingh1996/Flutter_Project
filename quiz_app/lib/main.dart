import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
     final _questions = const [
      {'questionText':'What\'s your favorite color?',
        'answer': [
                   {'text':'Black','score':10}, 
                   {'text':'Red','score': 5}, 
                   {'text':'Green','score':3},
                   {'text':'White','score':1},
                  ]
      },
      {'questionText':'What\'s your favorite animal?',
        'answer': [
                   {'text':'Cow','score':3}, 
                   {'text':'Dog','score':11}, 
                   {'text':'Rabbit','score':5}, 
                   {'text':'Lion','score':9},
                 ]
      },
      {'questionText':'What\'s your favorite country?',
        'answer': [
                   {'text':'India','score':1}, 
                   {'text':'USA','score':8}, 
                   {'text':'UK','score':7}, 
                   {'text':'Japan','score':5},
                 ]
      },
   ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
     setState(() {
           _questionIndex = 0;
           _totalScore = 0;
     });
  }
  void _answerQuestion(int score) {
   _totalScore += score;
  if(_questionIndex < _questions.length) {
    print("We have more question");
  } else{
    print("No more questions!");
  }
  setState(() {
     _questionIndex = _questionIndex+ 1;
  });
  }

  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App'),
    ),
      body: _questionIndex < _questions.length ?
             Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                 ) 
             : Result(_totalScore, _resetQuiz),
    ),
   );
  }
}




