import 'package:emart_app/consts/product_models.dart';
import 'package:emart_app/views/cart_screen/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/models/product_model.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: product.name.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: _shareProduct,
            icon: Icon(Icons.share, color: darkFontGrey),
          ),
          Obx(() => IconButton(
                onPressed: () => cartController.toggleFavorite(product.id),
                icon: Icon(
                  cartController.isFavorite(product.id)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: cartController.isFavorite(product.id)
                      ? redColor
                      : darkFontGrey,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Product Images
                  _buildProductImages(),

                  // Product Details
                  _buildProductDetails(),
                ],
              ),
            ),
          ),

          // Add to Cart Button
          _buildAddToCartButton(cartController),
        ],
      ),
    );
  }

  Widget _buildProductImages() {
    return VxSwiper.builder(
      autoPlay: true,
      height: 350,
      aspectRatio: 16 / 9,
      itemCount: product.image?.length ?? 1, // Use product images if available
      itemBuilder: (context, index) {
        return Image.asset(
          product.image != null ? product.image![index] : product.image,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildProductDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: whiteColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name
          product.name.text
              .size(18)
              .fontFamily(bold)
              .color(darkFontGrey)
              .make(),

          10.heightBox,

          // Rating
          VxRating(
            onRatingUpdate: (value) {}, // You can implement rating update later
            normalColor: textfieldGrey,
            selectionColor: golden,
            count: 5,
            size: 25,
            stepInt: true,
            value: product.rating,
          ),

          10.heightBox,

          // Price
          "\$${product.price.toStringAsFixed(2)}"
              .text
              .color(redColor)
              .fontFamily(bold)
              .size(18)
              .make(),

          20.heightBox,

          // Description Title
          "Description".text.color(darkFontGrey).fontFamily(semibold).make(),

          10.heightBox,

          // Product Description
          product.description.text.color(textfieldGrey).make(),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(CartController cartController) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Obx(() {
        final isInCart = cartController.isInCart(product.id);
        return ourButton(
          color: isInCart ? Colors.green : redColor,
          onPress: () => _handleCartAction(cartController, isInCart),
          textColor: whiteColor,
          title: isInCart ? 'View Cart' : 'Add to Cart',
        );
      }),
    );
  }

  void _handleCartAction(CartController cartController, bool isInCart) {
    if (isInCart) {
      Get.to(() => CartScreen());
    } else {
      cartController.addToCart(
        id: product.id,
        name: product.name,
        image: product.image,
        category: product.category,
        price: product.price,
      );
      _showAddedToCartSnackbar();
    }
  }

  void _showAddedToCartSnackbar() {
    Get.snackbar(
      'Success',
      'Product added to cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: whiteColor,
      duration: Duration(seconds: 2),
    );
  }

  void _shareProduct() {
    Get.snackbar(
      'Share',
      'Share this product with friends',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[200],
      duration: Duration(seconds: 2),
    );
  }
}
