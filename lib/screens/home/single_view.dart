import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/controllers/home/home_controller.dart';
import 'package:my_online_buddies/screens/home/single_detail_line.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/custom_button.dart';

class SingleFriendScreen extends StatelessWidget {
  final String? name;
  final String? number;
  final String? desc;
  final String? image;
  final String? friendKey;

  const SingleFriendScreen({
    super.key,
    this.name,
    this.number,
    this.desc,
    this.image,
    this.friendKey,
  });

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    height: Get.height / 2,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SingleDetailLine(name: 'Name:', details: name!),
                            const SizedBox(
                              height: 30.0,
                            ),
                            SingleDetailLine(name: 'Number:', details: number!),
                            const SizedBox(
                              height: 30.0,
                            ),
                            SingleDetailLine(
                                name: 'Description:', details: desc!)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Card(
                  elevation: 10.0,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundColor: kBlackColor,
                    backgroundImage: image == null
                        ? const AssetImage(kGallery)
                        : NetworkImage(image!) as ImageProvider,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: 'Delete',
                          buttonColor: Colors.red,
                          onTap: () {
                            friendKey == null
                                ? Get.snackbar(
                                    appName, 'Friend Can not be deleted')
                                : ctrl.deleteFriend(friendKey!).then((value) {
                                    Get.back();
                                  });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: 'Save',
                          buttonColor: Colors.green,
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
