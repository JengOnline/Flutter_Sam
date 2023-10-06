import 'package:flutter/material.dart';

class BigWord extends StatelessWidget {
  const BigWord({
    Key? key,
    required this.word,
  }) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(word, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
