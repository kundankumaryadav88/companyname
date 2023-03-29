import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hintValue;
  final bool? isChecking;
  final int? maxLine;
const CustomTextfield({ Key? key, 
  required this.controller,
   this.hintValue, 
   this.isChecking,
   this.maxLine }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
              maxLines: maxLine,
              controller: controller,
              enabled: isChecking,
              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                hintText: hintValue,
                border: const OutlineInputBorder(),
              ),
            );
  }
}