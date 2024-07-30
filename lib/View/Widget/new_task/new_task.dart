// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// import '../../../Controller/addHome.dart';
// import 'components/category_input.dart';
// import 'components/date_time.dart';
// import 'components/description_input.dart';
// import 'components/illustration_list.dart';
// import 'components/lable_input.dart';
// import 'components/task_button.dart';

// class NewTask extends StatelessWidget {
//   NewTask({super.key});

//   final controller = Get.put(AddHomeController());

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(
//             30,
//           ),
//           topRight: Radius.circular(30)),
//       child: Container(
//           height: 650,
//           width:  Responsive.isLargeTablet(context) ?MediaQuery.sizeOf(context).width/2.5 : Responsive.isTablet(context)? MediaQuery.sizeOf(context).width/1.6 : MediaQuery.sizeOf(context).width,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Stack(
//             children: [
//               Positioned.fill(
//                   child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SelectImageList(),
//                           LabelInput(),
//                           CategoryInput(),
//                           DescriptionInput(),
//                            DateTimeInput(),
//                         ],
//                       ),
//                     ),
//                   ),
//                    GestureDetector(
//                       onTap: () => controller.insertTask(context),
//                        child: CreateTaskButton())
//                 ],
//               ))
//             ],
//           )),
//     );
//   }
// }


