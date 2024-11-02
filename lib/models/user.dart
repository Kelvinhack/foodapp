class User {
  final String id;
  final String email;
  final String name;
  final String phone;
  final List<String> addresses;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.addresses,
  });
}