import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'package:scheshere/main_route.dart';

import 'package:scheshere/schedule_repository.dart';

import 'package:isar/isar.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.scheduleRepository});

  final ScheduleRepository scheduleRepository;

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
                    /* ボタンが押せる時 */ Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Main(scheduleRepository: scheduleRepository)));
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
