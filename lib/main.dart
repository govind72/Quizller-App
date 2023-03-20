import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizbrain = QuizBrain();
void main() => runApp(Quizzler());
int correct=0;

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> icons =[];

  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),

              onPressed: () {

                setState(() {
                  if(quizbrain.isFinished()==true){
                    return Alert(
                      context: context,

                      title: "FINISHED",
                      desc: "Yor reached at the end of quiz.\n"
                          "Your Score is :- $correct/13",
                      buttons: [

                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {

                              quizbrain.reset();
                              icons.clear();
                              Navigator.pop(context, true);
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();

                  }
                  else{
                    if('True' == quizbrain.getanswer()){
                      correct++;
                      icons.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    }
                    else{
                      icons.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));

                    }
                    quizbrain.nextquestion();

                  }




                });


                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {

                  if(quizbrain.isFinished()==true){
                    return Alert(
                      context: context,

                      title: "FINISHED",
                      desc: "Yor reached at the end of quiz.\n"
                          "Your Score is :- $correct/13",
                      buttons: [

                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {

                              quizbrain.reset();
                              icons.clear();
                              Navigator.pop(context, true);
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();

                  }
                 else{
                    if('False' == quizbrain.getanswer()){
                      correct++;
                      icons.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    }
                    else{
                      icons.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));

                    }
                  }
                  quizbrain.nextquestion();

                });
                //The user picked false.
              },
            ),
          ),
        ),

        Row(
          children: icons,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
