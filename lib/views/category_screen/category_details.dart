import 'package:emart_app/consts/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/models/product_model.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String title;
  final List<Product> products; // List of products for this category

  const CategoryDetails({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title.text.fontFamily(bold).white.make(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Category filter chips
              _buildCategoryFilters(),
              const SizedBox(height: 12),

              // Products grid
              _buildProductsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Replace with your actual subcategories
        itemBuilder: (context, index) {
          return Chip(
            label: "Subcategory $index"
                .text
                .size(12)
                .fontFamily(semibold)
                .color(darkFontGrey)
                .make(),
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).marginOnly(right: 8);
        },
      ),
    );
  }

  Widget _buildProductsGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return _buildProductCard(product);
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Get.to(() => ItemDetails(product: product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // Product details
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 40),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontFamily: semibold,
                        color: darkFontGrey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Product price
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: redColor,
                      fontFamily: bold,
                      fontSize: 16,
                    ),
                  ),

                  // Rating (optional)
                  if (product.rating != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: golden, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: darkFontGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
