import 'package:flutter/material.dart';
import 'package:scheshere/main.dart';
import 'body.dart';
import 'schedule_route.dart';
import 'hidukenyuuryoku_route.dart';
import 'package:provider/provider.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  String? isSelectedItem = 'a';
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text('a'),
                value: 'a',
              ),
              DropdownMenuItem(
                child: Text('b'),
                value: 'b',
              ),
              DropdownMenuItem(
                child: Text('c'),
                value: 'c',
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                isSelectedItem = value;
              });
            },
            value: isSelectedItem,
          ),
          const SizedBox(
            height: 32,
          ),
          Text('$isSelectedItem が選択されました。')
        ],
      )),
    );
  }
}
