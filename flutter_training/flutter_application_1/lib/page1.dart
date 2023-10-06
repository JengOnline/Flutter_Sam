import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/big_word_card.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // String word = generateWordPairs().first.asPascalCase;
  WordPair word = generateWordPairs().first;
  int _currenctIndex = 0;

  void generateWord() {
    var wordPair = generateWordPairs().first;
    setState(() {
      word = wordPair;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_currenctIndex) {
      case 0:
        page = buildHomePage();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        page = Container();
        break;
    }
    return Scaffold(
      body: Row(
        children: [
          Visibility(
              visible: MediaQuery.of(context).size.width > 600,
              child: NavigationRail(
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text("Home")),
                    NavigationRailDestination(
                        icon: Icon(Icons.favorite), label: Text("Favorite")),
                  ],
                  selectedIndex: _currenctIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _currenctIndex = index;
                    });
                  })),
          Expanded(
            child: page,
          )
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width > 600
          ? const Text("DeskTop")
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home", tooltip: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favorite",
                    tooltip: "Favorite"),
              ],
              currentIndex: _currenctIndex,
              onTap: (index) {
                setState(() {
                  _currenctIndex = index;
                });
              },
            ),
    );
  }

  Widget buildHomePage() {
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
                  onPressed: () {
                    //Navigate 1.0 for mobile
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => const SecondPage()),
                    // );

                    //Navigate 1.0 for web
                    // Navigator.of(context).pushNamed('/second');

                    
                  },
                  child: const Text("Favorite")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    generateWord();
                  },
                  child: const Text("Randomize")),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Back"),
          ),
        ));
  }
}
