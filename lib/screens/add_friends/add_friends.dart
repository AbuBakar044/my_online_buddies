import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/controllers/add_friends/add_friends_controller.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/custom_appbar.dart';
import 'package:my_online_buddies/widgets/custom_button.dart';
import 'package:my_online_buddies/widgets/custom_form_field.dart';

import '../../constants/constants.dart';

class AddFriendsScreen extends StatelessWidget {
  const AddFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addFrndCtrl = Get.put<AddFriendsController>(AddFriendsController());
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Add Friend',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: addFrndCtrl.addFrndFormKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundColor: kBlackColor,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomFormField(
                    controller: addFrndCtrl.friendNameCtrl,
                    hint: 'Add Name',
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomFormField(
                    controller: addFrndCtrl.friendNmbrCtrl,
                    hint: 'Add Number',
                    textInputType: TextInputType.phone,
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomFormField(
                    maxLines: 10,
                    controller: addFrndCtrl.friendDescCtrl,
                    hint: 'Add description',
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    text: 'Save',
                    onTap: addFrndCtrl.checkValidation,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
