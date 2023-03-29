import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
const CustomButton({ Key? key, required this.name, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextButton(
              onPressed:onPressed,
              child:  Text(name),
            ),
          );
  }
}