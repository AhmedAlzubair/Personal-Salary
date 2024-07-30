import 'package:flutter/material.dart';

import '../../Core/constent/appcolor.dart';
import '../../model/list.dart';

class DropDownCustom extends StatelessWidget {
  final List<ListTask> myList;
  //final controller;
  const DropDownCustom({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: AlignmentDirectional.bottomStart,
        focusColor: AppColor.primaryColor,
        dropdownColor: AppColor.green2,
        items: [
          ...List.generate(
              myList.length,
              (index) => DropdownMenuItem(
                
                alignment: Alignment.topLeft,
                    value: myList[index].list_name,
                    child: Text(
                      myList[index].list_name!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    ),
                    onTap: () {
                      // controller.onChange(
                      //     myList[index].list_id, myList[index].list_name);
                    },
                  ))
        ],
       //  value:controller.nameDe ,
        onChanged: (val) {});
  }
}
