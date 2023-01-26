import 'dart:io';
import 'package:get/get.dart';
import 'package:developer_board/src/controller/user_controller.dart';
import '../shared/global.dart';
import 'package:http/http.dart' as http;

class FeedRepository extends GetConnect{
  final userController = Get.put(UserController());

  @override
  void onInit(){
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<List?> feedIndex() async{
    String? token = await userController.getToken();
    if(token == null) return null;
    Response response = await get(
      "/api/posts",
      headers: {'token': token},
    );
    return response.statusCode == 401 ? null : response.body;
  }

  Future<Map?> fileUpload(File image, String filename) async{
    Response response = await post(
      '/file/upload',
      FormData({'file': MultipartFile(image, filename: filename),
      }),
    );
    if (response.statusCode != 200){
      return null;
    }
    return response.body;
  }

  Future<String?> feedCreate(int user_id, String title, String contents, String boardtype) async {
    String? token = await userController.getToken();
    if(token == null) return null;
    var url = Uri.http(Global.API_ROOT, '/api/posts');
    var response = await http.post(url, body: {'user_id': user_id, 'title': title, 'contents': contents, "boardtype": boardtype},
      headers: {'token': token});
    return (response.statusCode == 200) ? response.body : null;
  }
  Future<Map?> feedUpdate(int id, String content) async {
    String? token = await userController.getToken();
    if(token == null) return null;
    Response response = await put(
      "/api/posts/$id"
      ,
      {'contents': content},
      headers: {'token': token},
    );
    return (response.statusCode == 200) ? response.body : null;
  }
  Future<Map?> feedDelete(int id) async {
    String? token = await userController.getToken();
    if(token == null) return null;
    Response response = await delete(
      "/api/posts/$id"
      ,
      headers: {'token': token},
    );
    return (response.statusCode == 200) ? response.body : null;
  }
  Future<Map?> feedShow(int id) async {
    String? token = await userController.getToken();
    if(token == null) return null;
    Response response = await get(
      "/api/posts/$id"
      ,
      headers: {'token': token},
    );
    return (response.statusCode == 200) ? response.body : null;
  }

}