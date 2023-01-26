import 'package:validators/validators.dart';

Function validateUsername(){
  return (String? value){
    if(value!.isEmpty){
      return "이름에 공백이 들어갈 수 없습니다.";
    }else{
      return null;
    }
  };
}

Function validatePassword(){
  return (String? value){
    if(value!.isEmpty){
      return "비밀번호에 공백이 들어갈 수 없습니다.";
    }
    else{
      return null;
    }
  };

}

Function validateContent(){
  return (String? value){
    if(value!.isEmpty){
      return "내용에 공백이 들어갈 수 없습니다.";
    }else if(value.length>1000){
     return "내용의 길이를 초과했습니다.";
    }
    else{
      return null;
    }
  };

}

Function validateTitle(){
  return (String? value){
    if(value!.isEmpty){
      return "제목에 공백이 들어갈 수 없습니다.";
    }else if(value.length>50){
      return "제목의 길이를 초과했습니다.";
    }
    else{
      return null;
    }
  };

}
