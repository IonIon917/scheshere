import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'package:scheshere/main_route.dart';

login_route() {
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
                Text('ログイン',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.black,
                    )),
                TextField(
                    decoration: InputDecoration(
                  labelText: 'メールアドレス',
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                )),
                TextField(
                    decoration: InputDecoration(
                  labelText: 'パスワード',
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                )),
                ElevatedButton(
                  onPressed: () {
                    /* ボタンが押せる時 */ Navigator.push(context,
                        MaterialPageRoute(builder: (context) => main_route()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
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
