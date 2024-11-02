import '../models/restaurant.dart';
import '../models/menu_item.dart';

final mockRestaurants = [
  Restaurant(
    id: '1',
    name: 'Burger Palace',
    imageUrl: 'https://picsum.photos/200',
    rating: 4.5,
    cuisine: 'American',
    deliveryTime: '20-30 min',
    deliveryFee: 2.99,
  ),
  Restaurant(
    id: '2',
    name: 'Pizza Haven',
    imageUrl: 'https://picsum.photos/201',
    rating: 4.3,
    cuisine: 'Italian',
    deliveryTime: '25-35 min',
    deliveryFee: 3.99,
  ),
];

final mockMenuItems = {
  '1': [
    MenuItem(
      id: '1',
      name: 'Classic Burger',
      description: 'Juicy beef patty with fresh vegetables',
      price: 9.99,
      imageUrl: 'https://picsum.photos/202',
      category: 'Burgers',
    ),
    MenuItem(
      id: '2',
      name: 'Cheese Fries',
      description: 'Crispy fries with melted cheese',
      price: 4.99,
      imageUrl: 'https://picsum.photos/203',
      category: 'Sides',
    ),
  ],
};