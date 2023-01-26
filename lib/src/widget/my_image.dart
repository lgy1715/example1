import 'package:developer_board/src/widget/my_page.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/download.jpg'),
      width: 100, height: 100,
    );
  }
}
