import 'package:flutter/material.dart';
import 'package:my_app/src/presentation/bloc/couter_page.dart';
import 'package:my_app/src/presentation/feature1/feat2.dart';
import 'package:my_app/src/presentation/feature1/service1.dart';

class Feat1 extends StatefulWidget {
  const Feat1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Feat1> createState() => _Feat1State();
}

class _Feat1State extends State<Feat1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello flutter"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(widget.title),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feat2()));
            },
            child: Text('Press'),
          ),
          GestureDetector(
            child: Text("On tab"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feat2()));
            },
          ),
          Image.asset('assets/owl.jpg'),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CounterPage()));
            },
            child: Text('BLOC'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              service1();
            },
            child: Text('Press'),
          )
        ],
      ),
    );
  }
}
// Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));