import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:developer_board/src/Model/FeedModel.dart';
import 'package:developer_board/src/screen/home.dart';
import 'package:developer_board/src/util/validator_util.dart';
import 'package:developer_board/src/view/components/custom_elevated_button.dart';
import 'package:developer_board/src/view/components/custom_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:developer_board/src/widget/image_box.dart';
import 'package:developer_board/src/shared/global.dart';
import 'package:developer_board/src/controller/feed_controller.dart';
import 'package:xfile/xfile.dart';
import '../../view/components/custom_text_form_field.dart';

const snackBar = SnackBar(content: Text('글은 비워둘 수 없습니다'));

class FeedCreate extends StatefulWidget {
  final FeedModel? beforeFeed;
  const FeedCreate({super.key, this.beforeFeed});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final _picker = ImagePicker();
  final FeedController feedController = Get.put(FeedController());
  //int? tmpImg;

  Future<void> submit() async {
    String text = contentController.text;

    if (text == '') {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (widget.beforeFeed == null) {
        await feedController.feedCreate(1, titleController.text, contentController.text,  "free");
      } else {
        await feedController.feedEdit(
            widget.beforeFeed!.id!, contentController.text);
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Home()));
    }

  }

  void initState() {
    super.initState();
    _fillData();
  }

  _fillData() {
    if (widget.beforeFeed != null) {
      contentController.text = widget.beforeFeed!.contents!;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (widget.beforeFeed ==null) ? const Text('피드 작성'):const Text('피드 수정'),
        actions: [
          IconButton(
              onPressed: submit,
              icon: Icon(Icons.save)),
        ],
      ),
      body: SafeArea(
        top:false, child: Column(
      children: [
      CustomTextFormField(
      funcontroller: titleController,
        hint: "Title",
        funValidator: validateTitle(),
      ),
      CustomTextFormArea(
        funcontroller: contentController,
        hint: "Content",
        funValidator: validateContent(
        ),
      ),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            InkWell(
              onTap: null,
              child: ImageBox(child: const Icon(Icons.image)),
            ),
            SizedBox(width: 30,),
            //previewImage(),
          ],
        ),)
      ],
    ),

      ),
    );
  }
/*
  Widget previewImage(){
    if(tmpImg ==null){
      return const SizedBox();
    }
    return ImageBox(
      child: Image.network("{Global.API_ROOT}/file/$tmpImg",
      fit: BoxFit.cover,
      ),
    );
  }
*/
  /*Future<void> _upload() async{
    final file = await _picker.pickImage(source: ImageSource.gallery);
    int? result = await feedController.imageUpload(file!.path, file.name);
    if(result!= null){
      setState(() {
        tmpImg = result;
      });
    }
  }*/
}
