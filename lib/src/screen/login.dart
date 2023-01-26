import 'package:developer_board/src/screen/home.dart';
import 'package:developer_board/src/widget/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:developer_board/src/screen/user/register.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/components/custom_elevated_button.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async{
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if(token != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Home()));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('로그인 페이지', ) ,centerTitle: true,
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child:Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: '아이디'),
                        validator: (value){
                          if(value==null || value.trim().isEmpty){
                            return "아이디를 입력해주세요.";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: '비밀번호'),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          ElevatedButton(onPressed: (){
                            _login();

                          }, child: Text('로그인')),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Register()));
                          }, child: Text('회원가입')),
                        ],
                      ),
                    ],
                  ),
                )
            )
        )

    );
  }
}
