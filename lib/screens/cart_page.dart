import 'package:flutter/material.dart';
import '../services/cartService.dart';
import '../models/cart_model.dart';

class CartPage extends StatefulWidget {
  static String id = 'CartPage';

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The shopping cart'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // ملخص السلة
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total', style: TextStyle(fontSize: 16)),
                    Text(
                      '\$${CartService.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
                Text('${CartService.totalItems}Producer', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          // قائمة المنتجات
          Expanded(
            child: CartService.cartItems.isEmpty
                ? _buildEmptyCart()
                : ListView.builder(
              itemCount: CartService.cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(CartService.cartItems[index]);
              },
            ),
          ),

          // زر الشراء - النسخة البسيطة
          if (CartService.cartItems.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // عملية شراء بسيطة
                  CartService.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('The purchase was made successfully!Thank you'),
                        backgroundColor: Colors.green,
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Purchase completion \$${CartService.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // باقي الدوال (_buildEmptyCart, _buildCartItem) خليها نفسها
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text('The basket is empty', style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(cartItem.product.image, width: 60, height: 60),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.title.length > 20
                        ? '${cartItem.product.title.substring(0, 20)}...'
                        : cartItem.product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Price: \$${cartItem.product.price}'),


Text('Total: \$${cartItem.totalPrice.toStringAsFixed(2)}',
style: TextStyle(color: Colors.green)),
],
),
),
Column(
children: [
IconButton(
onPressed: () {
setState(() {
CartService.addToCart(cartItem.product);
});
},
icon: Icon(Icons.add, color: Colors.green),
),
Text('${cartItem.quantity}'),
IconButton(
onPressed: () {
setState(() {
if (cartItem.quantity > 1) {
CartService.updateQuantity(cartItem.product, cartItem.quantity - 1);
} else {
CartService.removeFromCart(cartItem.product);
}
});
},
icon: Icon(Icons.remove, color: Colors.red),
),
],
),
],
),
),
);
}
}