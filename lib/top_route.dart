import 'package:flutter/material.dart';
import 'package:scheshere/login_route.dart';

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
          color: Colors.white,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Scheshare',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 36,
                      color: Colors.black,
                    )),
                Text("スケジュール共有アプリ",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                ElevatedButton(
                  onPressed: () {
                    /* ボタンが押せる時 */ Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login_route()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 16,
                  ),
                  child: Text('ログイン'),
                ),
                ElevatedButton(
                  onPressed: () {/* ボタンが押せる時 */},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
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
