import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key, required this.favoriteWords}) : super(key: key);

  final List<WordPair> favoriteWords;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: favoriteWords
          .map((e) => ListTile(title: Text(e.asLowerCase)))
          .toList(),
    );
  }
}
