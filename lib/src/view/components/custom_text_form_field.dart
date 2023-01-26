import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final funcontroller;
  final String hint;
  final funValidator;

  const CustomTextFormField({required this.hint, required this.funValidator, required this.funcontroller});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      controller: funcontroller,
      validator: funValidator,
      decoration: InputDecoration(
          hintText: "$hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),


    ),
    );
  }
}
