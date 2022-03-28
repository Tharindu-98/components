import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class Sentence extends StatelessWidget {
  final String text;

  //Sentence is the most using component | and it also has only one parameter, So I make text as a positional parameter.
  const Sentence(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //tagEqualityChecker();//!Pluggable (comment that directly)  / if (kDebugMode)   - void+throw -
    return Text.rich(
      TextSpan(
        children: SentenceParser(commonText: text).mainParser(),
      ),
    );
  }

}



class SentenceParser {
  final String commonText;

  SentenceParser({required this.commonText});

  List<WidgetSpan> mainParser() {
    List<WidgetSpan> sentenceParts = [];
    String tempContent = "";

    for (int i = 0; i < commonText.length; i++) {
      /*
      ⚡ - word addder
      (i == commonText.length-1) - word adder
      ⛔ - tag adder
      */
      if (commonText[i] == "⚡") {
        if (kDebugMode) {
          print("commonText[i] == '⚡'");
        }
        if (tempContent.isNotEmpty) {
          sentenceParts.add(wordParser(tempContent));
          tempContent = "";
        } else {
          
        }
        tempContent = tempContent + commonText[i];
      } else if (commonText[i] == "⛔") {
        if (kDebugMode) {
          print("commonText[i] == '⛔'");
        }
        sentenceParts.add(tagParser(tempContent));
        tempContent = "";
        //below else if use for parsing the last word(eg:- Hello in "⚡m=eeee2⛔ Hello" )
      } else if (i == commonText.length-1) {
        if (kDebugMode) {
          print("i == commonText.length - 1 ${commonText[i]}");
        }
        tempContent = tempContent + commonText[i];
        if (tempContent.isNotEmpty) {
          sentenceParts.add(wordParser(tempContent));
          tempContent = "";
        } else {

        }
      } else {
        if (kDebugMode) {
          print("content++");
        }
        tempContent = tempContent + commonText[i];
      }
    }

    return sentenceParts;
  }

  //eg:- content = "⚡m=\fr3/2⛔"
  WidgetSpan tagParser(String content) {
    //content[0] = "⚡", so
    if (content[1] == "m") {
      //return Math widget coverd by WidgetSpan
      return WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Math.tex(
            content.substring(3, content.length),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ));
    } else {
      if (kDebugMode) {
        throw ErrorDescription("Tag doesnot have a type eg: no 'm'");
      } else {
        return WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Text(
            content.substring(1, content.length),
            style: const TextStyle(fontSize: 18.0),
          ),
        );
      }
    }
  }

  WidgetSpan wordParser(String content) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Text(
        content.substring(0, content.length),
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
