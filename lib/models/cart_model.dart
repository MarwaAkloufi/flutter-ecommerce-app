
import 'package:online_store/models/product_model.dart';
class CartItem {
  final ProductModel product;  // المنتج
  int quantity;                // الكمية

  // constructor
  CartItem({required this.product, this.quantity = 1});

  // دالة تحسب السعر الإجمالي
  double get totalPrice => product.price * quantity;
}