import 'package:flutter/material.dart';
import 'main_route.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBar extends State<MyAppBar> {
  @override
  bool _searchBoolean = false;
  Widget _searchTextField() {
    return TextField(
      autofocus: true,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.white,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: 'グループ検索',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        title: !_searchBoolean ? Text('Main') : _searchTextField(),
        actions: !_searchBoolean
            ? [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _searchBoolean = true;
                      });
                    })
              ]
            : [
                IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchBoolean = false;
                      });
                    })
              ]);
  }
}
