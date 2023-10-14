import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/controllers/auth/auth_controller.dart';
import 'package:my_online_buddies/screens/auth/register.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/custom_button.dart';
import 'package:my_online_buddies/widgets/custom_form_field.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCtrl = Get.put<AuthController>(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: authCtrl.lAuthFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyText(
                text: 'Login',
                color: kBlackColor,
                size: 20.0,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomFormField(
                controller: authCtrl.lEmailCtrl,
                hint: 'Email',
                validator: simpleValidator,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomFormField(
                controller: authCtrl.lPwdCtrl,
                hint: 'Password',
                validator: simpleValidator,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomButton(
                onTap: () async {
                  if (await authCtrl.validateAllFields(authCtrl.lAuthFormKey)) {
                    authCtrl.loginUser();
                  }
                },
                text: 'Login',
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const RegisterScreen());
                },
                child: const MyText(text: 'Don\'t have an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
