import 'package:flutter/material.dart';

class CustomTextFormArea extends StatelessWidget {
  final funcontroller;
  final String hint;
  final funValidator;

  const CustomTextFormArea({required this.hint, required this.funValidator, required this.funcontroller});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 20,
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
