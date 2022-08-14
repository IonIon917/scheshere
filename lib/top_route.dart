import 'package:flutter/material.dart';

top_route() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScheShare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ScheShare'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 33, 243, 219),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Scheshare',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                      color: Colors.white,
                    )),
                Text("スケジュール共有アプリ",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                ElevatedButton(
                  onPressed: () {/* ボタンが押せる時 */},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 33, 243, 219),
                    elevation: 16,
                  ),
                  child: Text('ログイン'),
                ),
                ElevatedButton(
                  onPressed: () {/* ボタンが押せる時 */},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 33, 243, 219),
                    elevation: 16,
                  ),
                  child: Text('新規登録'),
                ),
              ]),
        ),
      ),
    );
  }
}
