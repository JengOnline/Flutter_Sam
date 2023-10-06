import 'package:flutter/material.dart';
import 'package:flutter_1/components/big_word_card.dart';
import 'package:english_words/english_words.dart';

class RandomPage extends StatelessWidget {
  const RandomPage(
      {Key? key,
      required this.word,
      required this.onGenerateWordClicked,
      required this.onFavoriteClicked,
      required this.isFavorite})
      : super(key: key);

  final WordPair word;
  final VoidCallback onGenerateWordClicked;
  final VoidCallback onFavoriteClicked;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigWord(word: word.asPascalCase),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: onFavoriteClicked,
                  child: isFavorite
                      ? const Text("Remove")
                      : const Text("Favortie")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: onGenerateWordClicked,
                  child: const Text("Randomize")),
            ],
          ),
        ],
      ),
    );
  }
}
