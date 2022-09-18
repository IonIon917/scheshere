import 'package:flutter/material.dart';
import 'main_route.dart';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBody();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyBody extends State<MyBody> {}
