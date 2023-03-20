import 'question.dart';

class QuizBrain{
  int _x =0;
  List<Question> _questionbank = [
    Question(q: 'Some cats are actually allergic to humans', a: 'True'),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: 'False'),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: 'True'),
    Question(q: 'A slug\'s blood is green.', a: 'True'),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',a: 'True'),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: 'True'),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: 'False'),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: 'True'),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: 'False'),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: 'True'),
    Question(q: 'Google was originally called \"Backrub\".', a: 'True'),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: 'True'),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: 'True'),
  ];
  bool isFinished(){
    if(_x>=_questionbank.length-1){
      return true;
    }
    else return false;
  }
  void reset(){
    _x=0;
  }
  void nextquestion(){
    _x++;
  }

  String getquestion(){
    return _questionbank[_x].question;
  }
  String getanswer(){
    return _questionbank[_x].answer;
  }
}

