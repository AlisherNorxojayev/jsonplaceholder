class User {
  final String name;
  final String email;
  final int id;
  User({
    required this.name,
    required this.email,
    required this.id,
  });

  factory User.FromJson(Map data) {
    return User(
      name: data["name"],
      email: data["email"],
      id: data["id"],
    );
  }
}
