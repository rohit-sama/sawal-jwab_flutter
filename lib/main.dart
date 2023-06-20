import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

List<Widget> scoreKeeper = [];
List<String> questions = [
  "do you watch anime?",
  "have you seen death note?",
  "have you seen attack on titan?",
  "have you seen demon slayer?",
  "have you seen jujutsu kaisen",
  "have you seen naruto?",
  "have you seen bleach?",
  "have you seen one punch man?",
  "have you seen fullmetal alchemist?",
  "and finally, have you seen one piece?"
];
int count = 0;
int trueCount = 0;
int falseCount = 0;
  @override
  Widget build(BuildContext context) {
    if(count  == 10 && trueCount < 11 && trueCount > 6) {
      return Center(
        child: Column(
            children: [
              Container(
                height: 370.0,
              ),
                Expanded(
                child: Center(
                  child: Text("Congrats !! you scored $trueCount/10"  ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        count =0;
                        trueCount=0;
                        falseCount=0;
                        scoreKeeper.clear();
                        setState(() {});
                      },
                      child: const Text(
                        'GO BACK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 320.0,
              ),
            ],
          ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[count],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                count ++;
                trueCount++;
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),);
                });
              },
              child: const Text(
                'YES',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                count ++;
                falseCount++;
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),);
                });
              },
              child: const Text(
                'NO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
