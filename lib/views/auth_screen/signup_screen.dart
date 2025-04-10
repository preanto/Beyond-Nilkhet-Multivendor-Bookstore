import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo.widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // You missed importing this for StatefulWidget

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwrordretypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Create an Account at $appname"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(
                      hint: nameHint, title: name, controller: nameController),
                  customTextField(
                      hint: emailHint,
                      title: email,
                      controller: emailController),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: passwordController),
                  customTextField(
                      hint: passwordHint,
                      title: retypePassword,
                      controller: passwrordretypeController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make()),
                  ),
                  5.heightBox,
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth)
                  .make(),
              5.heightBox,
              Row(
                children: [
                  Checkbox(
                      checkColor: redColor,
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue;
                        });
                      }),
                  10.widthBox,
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termsandcond,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              ourButton(
                color: redColor,
                title: signup,
                textColor: whiteColor,
                onPress: () async {
                  if (isCheck == true) {
                    try {
                      await controller
                          .signupMethod(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) async {
                        await controller.storeUserData(
                          name: nameController.text,
                          password: passwordController.text,
                          email: emailController.text,
                        );
                        Get.offAll(() => const Home()); // Updated navigation
                      });
                    } catch (e) {
                      auth.signOut();
                      VxToast.show(context, msg: e.toString());
                    }
                  } else {
                    VxToast.show(context,
                        msg: "Please agree to terms & conditions");
                  }
                },
              ).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(fontFamily: bold, color: fontGrey),
                    ),
                    TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: redColor),
                    ),
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
