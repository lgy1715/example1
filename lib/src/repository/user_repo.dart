import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../shared/global.dart';

class UserRepo{
  register(String name, String email, String password) async{
    var url = Uri.http(Global.API_ROOT, '/api/users/register');
    var response = await http.post(url, body: {'name': name, 'email': email, 'password': password});

    if(response.statusCode == 200){
      return response.body;
    }else{
      return null;
    }
  }
}
