import 'package:developer_board/src/screen/feed/feed_show.dart';
import 'package:developer_board/src/widget/my_image.dart';
import 'package:flutter/material.dart';
import 'package:developer_board/src/widget/my_page.dart';
import 'package:developer_board/src/screen/feed/feed_show.dart';

class title extends StatelessWidget {
  const title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('zzzzzzzzzzzzzzzzzzzzzzzzzzzzz',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}