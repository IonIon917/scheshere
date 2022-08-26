import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';

main_route() {
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
                Text('メイン',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.white,
                    )),
                TextField(
                    decoration: InputDecoration(
                  labelText: 'メールアドレス',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(225, 33, 243, 219)),
                  filled: true,
                  fillColor: Colors.white,
                )),
                TextField(
                    decoration: InputDecoration(
                  labelText: 'パスワード',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(225, 33, 243, 219)),
                  filled: true,
                  fillColor: Colors.white,
                )),
                ElevatedButton(
                  onPressed: () {/* ボタンが押せる時 */},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 33, 243, 219),
                    elevation: 16,
                  ),
                  child: Text('ログイン'),
                ),
              ]),
        ),
      ),
    );
  }
}
