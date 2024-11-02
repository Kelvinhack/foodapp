import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/menu_item.dart';
import '../data/mock_data.dart';
import '../widgets/menu_item_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
    final menuItems = mockMenuItems[restaurant.id] ?? [];

    // Group menu items by category
    final menuByCategory = <String, List<MenuItem>>{};
    for (var item in menuItems) {
      if (!menuByCategory.containsKey(item.category)) {
        menuByCategory[item.category] = [];
      }
      menuByCategory[item.category]!.add(item);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(restaurant.name),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(' • ${restaurant.cuisine}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${restaurant.deliveryTime} • \$${restaurant.deliveryFee.toStringAsFixed(2)} delivery',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Divider(height: 32),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final category = menuByCategory.keys.elementAt(index);
                final items = menuByCategory[category]!;
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ...items.map((item) => MenuItemCard(menuItem: item)).toList(),
                    SizedBox(height: 16),
                  ],
                );
              },
              childCount: menuByCategory.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        label: Text('View Cart'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}