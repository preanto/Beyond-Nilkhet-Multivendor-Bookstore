import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/widgets_common/our_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Profile".text.color(darkFontGrey).fontFamily(bold).make(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Profile Picture Section
            Column(
              children: [
                Image.asset(
                  imgProfile,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                "John Doe"
                    .text
                    .fontFamily(bold)
                    .size(18)
                    .color(darkFontGrey)
                    .make(),
                "john.doe@example.com".text.color(textfieldGrey).make(),
              ],
            ).box.padding(const EdgeInsets.all(16)).make(),

            // Divider
            const Divider(color: lightGrey, height: 1),

            // Profile Details Section
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: darkFontGrey),
                  title: "Name"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  subtitle: "John Doe".text.color(textfieldGrey).make(),
                  trailing: const Icon(Icons.edit, color: darkFontGrey),
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: darkFontGrey),
                  title: "Phone"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  subtitle: "+1 234 567 890".text.color(textfieldGrey).make(),
                  trailing: const Icon(Icons.edit, color: darkFontGrey),
                ),
                ListTile(
                  leading: const Icon(Icons.email, color: darkFontGrey),
                  title: "Email"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  subtitle:
                      "john.doe@example.com".text.color(textfieldGrey).make(),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on, color: darkFontGrey),
                  title: "Address"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  subtitle:
                      "123 Main St, City".text.color(textfieldGrey).make(),
                  trailing: const Icon(Icons.edit, color: darkFontGrey),
                ),
                ListTile(
                  leading: const Icon(Icons.password, color: darkFontGrey),
                  title: "Change Password"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: darkFontGrey, size: 16),
                ),
              ],
            ).box.padding(const EdgeInsets.symmetric(horizontal: 16)).make(),

            // Divider
            const Divider(color: lightGrey, height: 1),

            // Other Options Section
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.shopping_bag, color: darkFontGrey),
                  title: "My Orders"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: darkFontGrey, size: 16),
                ),
                ListTile(
                  leading:
                      const Icon(Icons.favorite_border, color: darkFontGrey),
                  title: "Wishlist"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: darkFontGrey, size: 16),
                ),
                ListTile(
                  leading: const Icon(Icons.star_border, color: darkFontGrey),
                  title: "Reviews"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: darkFontGrey, size: 16),
                ),
              ],
            ).box.padding(const EdgeInsets.symmetric(horizontal: 16)).make(),

            // Logout Button
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                color: redColor,
                onPress: () {
                  // Handle logout
                },
                textColor: whiteColor,
                title: 'Logout',
              ),
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
