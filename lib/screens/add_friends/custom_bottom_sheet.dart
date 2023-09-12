import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

Future<void> showSheet(
    {BuildContext? context,
    Function()? onCameraClick,
    Function()? onGalleryClick}) async {
  showModalBottomSheet(
      context: context!,
      builder: (context) {
        return Container(
          height: Get.height / 3,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const MyText(
                    text: 'Pick Image From',
                    color: kWhiteColor,
                    size: 22.0,
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: onCameraClick,
                        child: Column(
                          children: [
                            Image.asset(
                              kCamera,
                              height: 60.0,
                              width: 60.0,
                            ),
                            const MyText(
                              text: 'Camera',
                              color: kWhiteColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: onGalleryClick,
                        child: Column(
                          children: [
                            Image.asset(
                              kGallery,
                              height: 60.0,
                              width: 60.0,
                            ),
                            const MyText(
                              text: 'Gallery',
                              color: kWhiteColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
