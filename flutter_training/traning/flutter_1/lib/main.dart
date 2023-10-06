import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/favorite_page.dart';
import 'package:flutter_1/random_page.dart';
// import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// var myAppRouter = GoRouter(
//   routers: <RouteBase>[
//     GoRoute(
//       name: "home",
//       path: '/',
//       builder: (context, state) => const MyHomePage(title: "title,")
//     ),
//     GoRoute(
//       name: "second",
//       path: '/second',
//       builder: (context, state) => const SecondPage();
//     )
//   ]
// ),

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WordPair word = generateWordPairs().first;

  int _currenctIndex = 0;
  List<WordPair> favoriteWords = [];
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
        page = RandomPage(
            word: word,
            onGenerateWordClicked: generateWord,
            onFavoriteClicked: () {
              setState(() {
                favoriteWords.contains(word)
                    ? favoriteWords.remove(word)
                    : favoriteWords.add(word);
              });
            },
            isFavorite: favoriteWords.contains(word));
        break;
      case 1:
        page = FavoritePage(
          favoriteWords: favoriteWords,
        );
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
