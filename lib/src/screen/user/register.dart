import 'package:developer_board/src/screen/home.dart';
import 'package:developer_board/src/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:developer_board/src/repository/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


//회원가입 상태창
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final userRepo = UserRepo();


  void _submitButton() async{
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;

    print("email: ${email} , name : ${name} , password: ${password}");

    final prefs = await SharedPreferences.getInstance();
    if(_formKey.currentState!.validate()){

      String token = await userRepo.register(name, email, password);
      if(token!= null){
        await prefs.setString('token', token);
        Navigator.push(context, MaterialPageRoute(builder: (b) => login()));
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('회원가입', ) ,centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child:Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: '이메일'),
                  validator: (value){
                    if(value==null || value.trim().isEmpty){
                      return "이메일을 입력해주세요.";
                    }
                    return null;
                  },
                ),
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
                ElevatedButton(onPressed: _submitButton, child: Text('가입하기')),
              ],
            ),
          )
        )
      )

    );
  }

}

