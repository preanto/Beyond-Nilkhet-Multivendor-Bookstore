import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applogo.widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

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
            "Create and Account at $appname"
                .text
                .fontFamily(bold)
                .white
                .size(18)
                .make(),
            10.heightBox,
            Column(
              children: [
                customTextField(hint: nameHint, title: name),
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                customTextField(hint: passwordHint, title: retypePassword),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make())),
                5.heightBox,
                //ourButton().box.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth)
                .make(),
            5.heightBox,
            // createNewAccount.text.color(fontGrey).make(),
            // 5.heightBox,
            // ourButton(
            //         color: golden,
            //         title: signup,
            //         textColor: redColor,
            //         onPress: () {})
            //     .box
            //     .width(context.screenWidth - 50)
            //     .make(),
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
                        text: const TextSpan(children: [
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
                ])))
              ],
            ),
            ourButton(
                    color: redColor,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () {})
                .box
                .width(context.screenWidth - 50)
                .make(),
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
    ));
  }
}
