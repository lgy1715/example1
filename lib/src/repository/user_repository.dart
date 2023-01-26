import 'package:get/get.dart';
import '../shared/global.dart';

class UserRepository extends GetConnect{
  @override
  void onInit(){
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_RRRR;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<String?> register(String name, String email, String password) async{
    Response response = await post(
      "/api/users/register",{
      'name': name,
      'email':email,
      'password': password,
    },
    );
    return (response.statusCode == 200) ? response.bodyString : null;
  }

  Future<String?> login(String email, String password) async{
    Response response = await post(
      "/api/users/login",{
      'email': email,
      'password':password,
    },
    );
    return (response.statusCode == 200) ? response.bodyString : null;
  }

}