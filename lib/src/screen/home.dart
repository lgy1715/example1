import 'package:developer_board/src/screen/feed/feed_show.dart';
import 'package:developer_board/src/widget/feed_item.dart';
import 'package:developer_board/src/widget/my_page.dart';
import 'package:flutter/material.dart';
import 'package:developer_board/src/screen/user/register.dart';
import 'package:developer_board/src/widget/title.dart';
import 'package:flutter/src/material/user_accounts_drawer_header.dart';
import 'package:get/get.dart';
import 'package:developer_board/src/screen/feed/feed_create.dart';

import '../controller/feed_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final feedController = Get.put(FeedController());

  void initState(){
    super.initState();
    _fetchData();
  }
  void _fetchData() async{
    bool result = await feedController.feedIndex();
    if(!result){
      Get.off(const Register());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자유게시판'),centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
            children:<Widget> [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(// 현재 계정 이미지 set
                  backgroundImage: AssetImage('assets/images/download.png'),
                  backgroundColor: Colors.white,
                ),

                accountName: Text('이관용'),
                accountEmail: Text('lgy17150@tukorea.ac.kr'),
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
              ),
              ListTile(
                leading: Icon(
                  Icons.pages,
                  color: Colors.grey[850],
                ),
                title: Text('마이페이지'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const MyPage()));
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[850],
                ),
                title: Text('자유게시판'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Home()));
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.computer,
                  color: Colors.grey[850],
                ),
                title: Text('프론트엔드 게시판'),
                onTap: () {
                  print('Setting is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.computer,
                  color: Colors.grey[850],
                ),
                title: Text('벡엔드 게시판'),
                onTap: () {
                  print('Setting is clicked');
                },
                trailing: Icon(Icons.add),
              ),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> FeedCreate()));
        },
        child: Icon(Icons.create),
      ),
      body: GetBuilder<FeedController>(
          builder: (c) {
            List ? feedList = c.feedList;
            return ListView.separated(itemBuilder:(context, index)=> FeedItem(feedList[index]), separatorBuilder:
                (context,index) => Divider(), itemCount: feedList!.length,);

          }
      ),
    );
  }
}
