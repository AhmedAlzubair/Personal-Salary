// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_managment_users/Core/constent/appcolor.dart';



// import '../../../../Controller/addHome.dart';
// import 'text_input.dart';

// class CategoryInput extends StatelessWidget {
//   CategoryInput({super.key});

//   final controller = Get.put(AddHomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: AppColor.defaultPadding / 2,
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Text(
//               'Category',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Obx(() => TextInputField(
//             controller: controller.listTask,
//             hint: 'Select Category',
//             focus: controller.categoryFocus.value,
//             onTap: () =>controller.setCategoryFocus(),
//           ),)
//         ],
//       ),
//     );
//   }
// }
