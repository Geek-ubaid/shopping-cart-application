import 'package:flutter/material.dart';
import 'home_drawer.dart';
import 'home_content.dart';
import '../cart/shopping_cart.dart';
import 'models/product.dart';
import '../cart/models/cart_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "women"; // Default category
  final List<CartItem> cartItems = []; // Cart state maintained here

  void _addToCart(Product product, int quantity) {
    setState(() {
      final existingIndex = cartItems.indexWhere((item) => item.product.id == product.id);
      if (existingIndex >= 0) {
        cartItems[existingIndex].quantity += quantity;
      } else {
        cartItems.add(CartItem(product: product, quantity: quantity));
      }
    });
  }

  void _removeFromCart(String productId) {
    setState(() {
      cartItems.removeWhere((item) => item.product.id == productId);
    });
  }

  void _updateQuantity(String productId, int newQuantity) {
    setState(() {
      final index = cartItems.indexWhere((item) => item.product.id == productId);
      if (index >= 0) {
        if (newQuantity > 0) {
          cartItems[index].quantity = newQuantity;
        } else {
          cartItems.removeAt(index);
        }
      }
    });
  }

  void _clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(
        selectedCategory: selectedCategory,
        onCategoryChanged: (category) {
          setState(() => selectedCategory = category);
        },
      ),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo path
            height: 40, // Adjust height as needed
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 53, 44, 43)),
            onPressed: () {
              // Handle notification button press
            },
          ),
          const SizedBox(width: 8), // Space between icons
        ],
      ),
      body: HomeContent(
        onAddToCart: _addToCart, // Pass callback to content
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    onRemoveItem: _removeFromCart,
                    onUpdateQuantity: _updateQuantity,
                    onClearCart: _clearCart,
                  ),
                ),
              );
            },
            backgroundColor: Color.fromARGB(255, 53, 44, 43),
            child: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          if (cartItems.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Text(
                  cartItems.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
