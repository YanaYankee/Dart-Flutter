import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler; // or VoidCallback (yjthing will be passed as argument)
  final String answerText;
  
  const Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromARGB(255, 237, 113, 157)),
          foregroundColor: MaterialStateProperty.all(
            Color.fromARGB(255, 238, 255, 0)),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}