
import 'dart:io';

import 'package:get/get.dart';
import 'package:developer_board/src/model/FeedModel.dart';
import 'package:developer_board/src/repository/feed_repository.dart';


class FeedController extends GetxController{
  final feedRepo = Get.put(FeedRepository());
  List ? feedList = [];
  FeedModel ? feedOne;

   getfeedOne(){
    return feedOne;
  }
  Future<bool> feedIndex() async{
    List? body = await feedRepo.feedIndex();
    if(body == null){
      return false;
    }
    List feed = body.map(((e)=> FeedModel.parse(e))).toList();
    feedList = feed;
    update();
    return true;
  }


  Future<int> imageUpload(String path, String name) async {
    File file = File(path);
    Map? body = await feedRepo.fileUpload(file,name);
    return (body ==null)? null:body['id'];
  }

  feedShow(int id) async {
    Map? body = await feedRepo.feedShow(id);
    if (body == null) {
      return null;
    }
    FeedModel feed = FeedModel.parse(body);
    feedOne = feed;
    update();
    return feed;
  }
  feedCreate(int user_id, String title, String contents, String board_type) async {
    await feedRepo.feedCreate(user_id, title, contents,board_type );
    await feedIndex();
  }
  feedDelete(int id) async {
    await feedRepo.feedDelete(id);
    await feedIndex();
  }
  feedEdit(int id, String content) async {
    await feedRepo.feedUpdate(id, content);
    await feedShow(id);
  }
}
