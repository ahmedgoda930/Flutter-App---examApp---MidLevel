import 'package:exam/quetion.dart';

class AppData {
  int _qNo = 0;
  List<Question> _Questions = [
    new Question(
        txt: 'اللون اللى فى الصورة بامبى؟',
        txtImage: 'assets/image-1.jpg',
        answ: true),
    new Question(
        txt: 'لو الفراشة فى الصورة ازرق',
        txtImage: 'assets/image-2.jpg',
        answ: false),
    new Question(
        txt: 'ها الحيوان يسمى كلب البحر',
        txtImage: 'assets/image-3.jpg',
        answ: true),
    new Question(
        txt: 'القطط حيوانات مفترسة',
        txtImage: 'assets/image-4.jpg',
        answ: false),
    new Question(
        txt: 'الموطن الرئيسي لهذا الحيوان استراليا',
        txtImage: 'assets/image-5.jpg',
        answ: true),
  ];

  void nextQuestion() {
    if (_qNo < _Questions.length - 1) _qNo++;
  }

  Question getQuestion() {
    try {
      return _Questions[_qNo];
    } catch (e) {
      throw e;
    }
  }

  int getQuestionLength() {
    return _Questions.length;
  }

  bool isFinished() {
    if (_qNo >= _Questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qNo = 0;
  }
}
