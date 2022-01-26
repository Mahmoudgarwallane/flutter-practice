import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        storyTitle:
            'انفجر اطار سيارتك في طريق متعرج مهجور بدون استقبال اشارة للهاتف الخلوي. و تريد أن تعود الى بيتك. شاحنة صغيرة صدئة تتوقّف بجوارك. رجل بقبعة حادة الحواف وعيون مهولة يفتح لك باب الركاب ويسأل: هل تريد توصيلة يا فتى؟',
        choice1: '!سوف أركب. شكرا على  المساعدة',
        choice2: 'من الأفضل أن أسأله أولاً  ما إن كان قاتلاً '),
    Story(
        storyTitle: 'أومأ رأسه ببطء ، غير مكترث للسؤال',
        choice1: ' أحترم صدقه .لهذا سأركب معه  .',
        choice2: 'انتظر ،أنا أعرف كيف أغير الاطارات.'),
    Story(
        storyTitle:
            'عندما بدأ في القيادة ، استهل الرجل الغريب  حديثا عن علاقته بوالدته. و أخذ يغضب أكثر فأكثر  مع مرور الوقت. بعد هنيهة طلب منك فتح صندوق القفازات. وجدت داخله سكينًا ملطختا بالدماء ، وإصبعين مقطوعين ، وشريط كاسيت لفيروز',
        choice1: '!تناوله الشريط قائلا: أنا أحب فيروز  .',
        choice2: '!تأخذ السكين وتطعنه'),
    Story(
        storyTitle:
            'ماذا؟ يا له من عذر ! هل تعلم أن حوادث المرور هي السبب الرئيسي الثاني للوفاة العرضية لمعظم البالغين؟',
        choice1: 'إعادة',
        choice2: ''),
    Story(
        storyTitle:
            'تحطم حاجز الطريق وتتجه نحو الصخور  ، مفكرا  في الحكمة  المتمثلة في طعن شخص ما أثناء قيادته للسيارة التي أنت بداخلها',
        choice1: 'إعادة',
        choice2: ''),
    Story(
        storyTitle:
            ' بينما تعانق القاتل و تغنيان  . يوصلك إلى البلدة التالية.و قبل أن تذهب يسألك إذا ما كنت تعرف أماكن جيدة لإلقاء الجثث. ترد: جرب الرصيف',
        choice1: 'إعادة',
        choice2: '')
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;
  String getChoice1() => _storyData[_storyNumber].choice1;
  String getChoice2() => _storyData[_storyNumber].choice2;

  int _storyNumber = 0;

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
