enum OrderStatus {
  pending,
  confirmed,
  preparing,
  onTheWay,
  delivered
}

class Order {
  final String id;
  final String userId;
  final String restaurantId;
  final List<OrderItem> items;
  final double subtotal;
  final double tax;
  final double total;
  final OrderStatus status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.total,
    required this.status,
    required this.createdAt,
  });
}

class OrderItem {
  final String menuItemId;
  final int quantity;
  final double price;

  OrderItem({
    required this.menuItemId,
    required this.quantity,
    required this.price,
  });
}