import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_online_buddies/controllers/add_friends/add_friends_controller.dart';
import 'package:my_online_buddies/screens/add_friends/custom_bottom_sheet.dart';
import 'package:my_online_buddies/widgets/custom_appbar.dart';
import 'package:my_online_buddies/widgets/custom_button.dart';
import 'package:my_online_buddies/widgets/custom_form_field.dart';

import '../../constants/constants.dart';

class EditFriendsScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? number;
  final String? desc;
  final String? friendKey;
  const EditFriendsScreen({
    super.key,
    this.image,
    this.name,
    this.number,
    this.desc,
    this.friendKey,
  });

  @override
  State<EditFriendsScreen> createState() => _EditFriendsScreenState();
}

class _EditFriendsScreenState extends State<EditFriendsScreen> {
  final addFrndCtrl = Get.put<AddFriendsController>(AddFriendsController());

  @override
  void initState() {
    addFrndCtrl.key = widget.friendKey!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Edit Friend',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: addFrndCtrl.addFrndFormKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showSheet(
                        context: context,
                        onCameraClick: () {
                          addFrndCtrl
                              .pickImage(ImageSource.camera)
                              .then((value) => Get.back());
                          
                        },
                        onGalleryClick: () {
                          addFrndCtrl
                              .pickImage(ImageSource.gallery)
                              .then((value) => Get.back());
                          
                        },
                      );
                    },
                    child: GetBuilder<AddFriendsController>(builder: (ctrl) {
                      return CircleAvatar(
                        radius: 60.0,
                        //backgroundImage: widget.image != null ? NetworkImage(widget.image!) : ctrl.friendImage ,
                        backgroundImage: widget.image != null
                            ? NetworkImage(widget.image!)
                            : ctrl.friendImage != null
                                ? MemoryImage(ctrl.friendImage!)
                                : const AssetImage(kCamera) as ImageProvider,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomFormField(
                    controller: addFrndCtrl.friendNameCtrl,
                    hint: widget.name,
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomFormField(
                    controller: addFrndCtrl.friendNmbrCtrl,
                    hint: widget.number,
                    textInputType: TextInputType.phone,
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomFormField(
                    maxLines: 10,
                    controller: addFrndCtrl.friendDescCtrl,
                    hint: widget.desc,
                    validator: simpleValidator,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    text: 'Update',
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
