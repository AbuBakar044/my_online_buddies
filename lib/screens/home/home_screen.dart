import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/screens/add_friends/add_friends.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/custom_appbar.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Home Screen',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddFriendsScreen());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add_circle_sharp,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
