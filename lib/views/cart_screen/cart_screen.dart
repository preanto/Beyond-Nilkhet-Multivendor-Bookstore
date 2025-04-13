import 'package:emart_app/views/cart_screen/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:emart_app/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shopping Cart".text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          Obx(() => cartController.cartItems.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () => _showClearCartDialog(cartController),
                  icon: const Icon(Icons.delete_outline, color: darkFontGrey),
                )),
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return _buildEmptyCart();
        }
        return _buildCartWithItems(cartController);
      }),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgP5, width: 150),
          20.heightBox,
          "Your cart is empty".text.color(darkFontGrey).size(18).make(),
          20.heightBox,
          ourButton(
            color: redColor,
            onPress: () => Get.back(),
            textColor: whiteColor,
            title: "Continue Shopping",
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems(CartController cartController) {
    return Column(
      children: [
        // Cart Items List
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: cartController.cartItems.length,
            separatorBuilder: (context, index) => 8.heightBox,
            itemBuilder: (context, index) =>
                _buildCartItem(cartController, index),
          ),
        ),

        // Order Summary Section
        _buildOrderSummary(cartController),
      ],
    );
  }

  Widget _buildCartItem(CartController cartController, int index) {
    final item = cartController.cartItems[index];

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: whiteColor),
      ),
      onDismissed: (direction) => cartController.removeFromCart(index),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: lightGrey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Image.asset(
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              12.widthBox,

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name and Remove Button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontFamily: bold,
                              color: darkFontGrey,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close,
                              size: 18, color: textfieldGrey),
                          onPressed: () => cartController.removeFromCart(index),
                        ),
                      ],
                    ),
                    4.heightBox,

                    // Category
                    Text(
                      item.category,
                      style: const TextStyle(
                        color: textfieldGrey,
                        fontSize: 12,
                      ),
                    ),
                    8.heightBox,

                    // Price and Quantity
                    Row(
                      children: [
                        // Price
                        Text(
                          "\$${item.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: redColor,
                            fontFamily: bold,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),

                        // Quantity Controls
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                onPressed: () =>
                                    cartController.decreaseQuantity(index),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              8.widthBox,
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(fontFamily: bold),
                              ),
                              8.widthBox,
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                onPressed: () =>
                                    cartController.increaseQuantity(index),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildOrderSummary(CartController cartController) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, -3),
          )
        ],
      ),
      child: Column(
        children: [
          // Order Summary
          Container(
            decoration: BoxDecoration(
              color: lightGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _buildSummaryRow(
                  "Subtotal:",
                  "\$${cartController.subtotal.toStringAsFixed(2)}",
                ),
                8.heightBox,
                _buildSummaryRow(
                  "Shipping:",
                  "\$${cartController.shipping.toStringAsFixed(2)}",
                ),
                const Divider(color: textfieldGrey, height: 24),
                _buildSummaryRow(
                  "Total:",
                  "\$${cartController.total.toStringAsFixed(2)}",
                  isTotal: true,
                ),
              ],
            ),
          ),
          16.heightBox,

          // Checkout Button
          SizedBox(
            width: double.infinity,
            child: ourButton(
              color: redColor,
              onPress: () => _proceedToCheckout(),
              textColor: whiteColor,
              title: "Proceed to Checkout",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: darkFontGrey,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: darkFontGrey,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
      ],
    );
  }

  void _showClearCartDialog(CartController cartController) {
    Get.defaultDialog(
      title: "Clear Cart",
      content: const Text("Are you sure you want to remove all items?"),
      confirm: ourButton(
        color: redColor,
        onPress: () {
          cartController.clearCart();
          Get.back();
        },
        textColor: whiteColor,
        title: "Yes",
      ),
      cancel: ourButton(
        color: lightGrey,
        onPress: () => Get.back(),
        textColor: darkFontGrey,
        title: "No",
      ),
    );
  }

  void _proceedToCheckout() {
    // Implement checkout logic here
    Get.snackbar(
      "Checkout",
      "Proceeding to checkout",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
