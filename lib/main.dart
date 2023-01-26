import 'package:developer_board/src/screen/login.dart';
import 'package:developer_board/src/widget/feed_item.dart';
import 'package:developer_board/src/widget/my_page.dart';
import 'package:flutter/material.dart';
import './src/screen/user/register.dart';
import './src/screen/home.dart';


void main() {


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
