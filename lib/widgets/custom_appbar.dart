import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  const CustomAppBar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 70.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff1488CC),
          Color(0xff2B32B2),
        ])),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: MyText(
            text: text,
            color: kWhiteColor,
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 70.0);
}
