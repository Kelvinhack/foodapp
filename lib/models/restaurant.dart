class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String cuisine;
  final String deliveryTime;
  final double deliveryFee;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.cuisine,
    required this.deliveryTime,
    required this.deliveryFee,
  });
}