import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual order history data
    final mockOrders = [
      Order(
        id: '1',
        userId: '1',
        restaurantId: '1',
        items: [
          OrderItem(menuItemId: '1', quantity: 2, price: 9.99),
          OrderItem(menuItemId: '2', quantity: 1, price: 4.99),
        ],
        subtotal: 24.97,
        tax: 2.50,
        total: 27.47,
        status: OrderStatus.delivered,
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      Order(
        id: '2',
        userId: '1',
        restaurantId: '2',
        items: [
          OrderItem(menuItemId: '3', quantity: 1, price: 12.99),
        ],
        subtotal: 12.99,
        tax: 1.30,
        total: 14.29,
        status: OrderStatus.onTheWay,
        createdAt: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ];

    return Column(
      children: mockOrders.map((order) => OrderHistoryCard(order: order)).toList(),
    );
  }
}

class OrderHistoryCard extends StatelessWidget {
  final Order order;

  const OrderHistoryCard({Key? key, required this.order}) : super(key: key);

  Color _getStatusColor() {
    switch (order.status) {
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.onTheWay:
        return Colors.blue;
      case OrderStatus.preparing:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.purple;
      case OrderStatus.pending:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: Text(
                    order.status.toString().split('.').last,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getStatusColor(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${_formatDate(order.createdAt)}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            Divider(height: 24),
            Text(
              '${order.items.length} items',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              'Total: \$${order.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // TODO: Implement order details
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order details coming soon!')),
                );
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}