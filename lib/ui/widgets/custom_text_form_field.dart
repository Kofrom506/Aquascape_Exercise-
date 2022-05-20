import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: cDarkGreyColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: cWhiteColor,
            controller: controller,
            style: WhiteFont,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: WhiteFont,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: cDarkGreyColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: cWhiteColor))),
          )
        ],
      ),
    );
  }
}
