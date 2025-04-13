import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final String category;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    this.quantity = 1,
  });
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var favorites = <String>[].obs;

  // Add sample data for demonstration (remove this in production)
  @override
  void onInit() {
    super.onInit();
    cartItems.addAll([
      CartItem(
        id: '1',
        name: 'Product 1',
        image: imgP5,
        category: 'Electronics',
        price: 99.99,
      ),
      CartItem(
        id: '2',
        name: 'Product 2',
        image: imgP3,
        category: 'Clothing',
        price: 49.99,
      ),
    ]);
  }

  // Cart total calculations
  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get shipping => 5.0; // Fixed shipping cost
  double get total => subtotal + shipping;

  // Cart operations
  bool isInCart(String productId) =>
      cartItems.any((item) => item.id == productId);

  void addToCart({
    required String id,
    required String name,
    required String image,
    required String category,
    required double price,
  }) {
    if (!isInCart(id)) {
      cartItems.add(CartItem(
        id: id,
        name: name,
        image: image,
        category: category,
        price: price,
      ));
    }
  }

  void increaseQuantity(int index) {
    if (index < cartItems.length) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(int index) {
    if (index < cartItems.length && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void removeFromCart(int index) {
    if (index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  // Favorite operations
  bool isFavorite(String productId) => favorites.contains(productId);

  void toggleFavorite(String productId) {
    if (isFavorite(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
  }
}
