import 'package:flutter/material.dart';
import 'main_route.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  bool _searchBoolean = false;
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 33, 243, 219),
        title: Text('Main'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchBoolean = true;
                });
              })
        ]);
  }
}
