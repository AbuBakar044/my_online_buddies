import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  const CustomButton({
    super.key,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.0,
        width: Get.width / 2,
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: Center(
          child: MyText(
            text: text,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
