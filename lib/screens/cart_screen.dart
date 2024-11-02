import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.itemCount == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Browse Restaurants'),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items.values.elementAt(index);
                    return CartItemCard(item: item);
                  },
                ),
              ),
              OrderSummary(cart: cart),
            ],
          );
        },
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.menuItem.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.menuItem.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${item.menuItem.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            QuantitySelector(item: item),
          ],
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final CartItem item;

  const QuantitySelector({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            context.read<CartProvider>().updateQuantity(
                  item.menuItem.id,
                  item.quantity - 1,
                );
          },
        ),
        Text(
          item.quantity.toString(),
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            context.read<CartProvider>().updateQuantity(
                  item.menuItem.id,
                  item.quantity + 1,
                );
          },
        ),
      ],
    );
  }
}

class OrderSummary extends StatelessWidget {
  final CartProvider cart;

  const OrderSummary({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtotal = cart.total;
    final tax = subtotal * 0.1; // 10% tax
    final total = subtotal + tax;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal'),
              Text('\$${subtotal.toStringAsFixed(2)}'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax (10%)'),
              Text('\$${tax.toStringAsFixed(2)}'),
            ],
          ),
          Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement checkout
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Checkout coming soon!')),
              );
            },
            child: Text('Proceed to Checkout'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              minimumSize: Size(double.infinity, 0),
            ),
          ),
        ],
      ),
    );
  }
}