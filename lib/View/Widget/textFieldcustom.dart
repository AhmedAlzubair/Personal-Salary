import 'dart:ui';

import 'package:flutter/material.dart';

import '../../Core/constent/appcolor.dart';


class TextFieldCustom extends StatelessWidget {
  final String? label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? type;
  final Function()? onpressed;
  const TextFieldCustom(
      {super.key,
       this.label,
      required this.hint,
      required this.icon,
      this.type,
      required this.controller,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color.fromARGB(235, 5, 83, 100),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
              keyboardType: type,
              decoration: InputDecoration(
                //fillColor: ,

                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusColor: AppColor.primaryColor2,
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.white, width: 2)),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                label: Text(
                  label!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
                //  border:const OutlineInputBorder(borderSide: BorderSide(width: 2)),
                hintText: hint,
                hintStyle: const TextStyle(color: AppColor.white, fontSize: 10),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: onpressed,
                // () {
                //   // const DateTimePicker();
                //   onpressed;
                // },
                icon: Icon(icon),
                color: AppColor.white,
              )),
        ],
      ),
    );
  }
}
