import 'package:flutter/material.dart';
import 'package:scheshere/login_route.dart';

import 'package:scheshere/schedule_repository.dart';

class Top extends StatelessWidget {
  const Top({
    super.key,
    required this.scheduleRepository,
  });
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
                    /* ボタンが押せる時 */ Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  scheduleRepository: scheduleRepository,
                                )));
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
