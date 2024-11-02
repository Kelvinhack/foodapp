import 'package:flutter/foundation.dart';
import '../models/menu_item.dart';

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
  });

  double get total => menuItem.price * quantity;
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get total => _items.values.fold(0, (sum, item) => sum + item.total);

  void addItem(MenuItem menuItem) {
    if (_items.containsKey(menuItem.id)) {
      _items[menuItem.id]!.quantity += 1;
    } else {
      _items[menuItem.id] = CartItem(menuItem: menuItem);
    }
    notifyListeners();
  }

  void removeItem(String menuItemId) {
    _items.remove(menuItemId);
    notifyListeners();
  }

  void updateQuantity(String menuItemId, int quantity) {
    if (_items.containsKey(menuItemId)) {
      if (quantity > 0) {
        _items[menuItemId]!.quantity = quantity;
      } else {
        _items.remove(menuItemId);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}