import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule-create_route.dart';
import 'body.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(children: <Widget>[
            Text('Create',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 36,
                  color: Colors.black,
                )),
          ]),
        ),
      ),
    );
  }
}
