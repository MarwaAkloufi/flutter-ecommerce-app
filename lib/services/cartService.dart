
import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartService {
 static List<CartItem> _cartItems = [];

  static List<CartItem> get cartItems => List.from(_cartItems);

 static void addToCart(ProductModel product) {
    int index = _cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      // المنتج موجود - نزيد الكمية
      _cartItems[index].quantity++;
    } else {
      // المنتج جديد - نضيفه
      _cartItems.add(CartItem(product: product));
    }
  }

 static void removeFromCart(ProductModel product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
  }

 static void updateQuantity(ProductModel product, int newQuantity) {
    int index = _cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      if (newQuantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = newQuantity;
      }
    }
  }

 static  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  static int get totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

 static void clearCart() {
    _cartItems.clear();
  }
}