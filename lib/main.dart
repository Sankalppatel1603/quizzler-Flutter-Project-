import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

void main() => runApp(quizzler());

class quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickAnswer){
    bool correctAnswer =QuizBrain().getCorrectAnswer();
    setState(() {
    if(userPickAnswer == correctAnswer){
      scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }else{
      scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }
      QuizBrain().nextQuestion();
    }); 
  }
  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bone in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // Question q1=Question(q: 'You can lead a cow down stairs but not up stairs.', a: false);

  // List <Question> questionBank=[
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(q: 'Approximately one quarter of human bone in the feet.', a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true)
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  QuizBrain().getQuestionText(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
        Expanded(
            child: Container(
          width: 15,
          height: 15,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        )),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
