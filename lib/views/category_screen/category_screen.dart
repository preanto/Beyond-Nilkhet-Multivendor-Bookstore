import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/category_screen/category_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Changed from maxCrossAxisExtent
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8, // Better aspect ratio for category items
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize:
                      MainAxisSize.min, // Prevent column from expanding
                  children: [
                    // Image container with fixed aspect ratio
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          categoryImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Category name with constrained height
                    SizedBox(
                      height: 40, // Fixed height for text
                      child: category[index]
                          .text
                          .color(darkFontGrey)
                          .size(12)
                          .align(TextAlign.center)
                          .maxLines(2)
                          .overflow(TextOverflow.ellipsis)
                          .make(),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadowSm
                    .make()
                    .onTap(() {
                  Get.to(() => CategoryDetails(
                        title: category[index],
                        products: [],
                      ));
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
