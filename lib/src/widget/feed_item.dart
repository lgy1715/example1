import 'package:developer_board/src/Model/FeedModel.dart';
import 'package:developer_board/src/screen/feed/feed_show.dart';
import 'package:developer_board/src/widget/my_image.dart';
import 'package:developer_board/src/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:developer_board/src/widget/my_page.dart';
import 'package:developer_board/src/screen/feed/feed_show.dart';
import 'package:get/get.dart';

class FeedItem extends StatelessWidget {
  final FeedModel feed;
  const FeedItem(this.feed, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(()=> FeedShow(feed));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyPage(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      Text(
                        '($feed.user_name)',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '($feed.createAt)',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '($feed.content)',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
