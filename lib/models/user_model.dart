// User model for mobile rewards app

class User {
  String id;
  String name;
  String email;
  List<String> rewards;

  User({required this.id, required this.name, required this.email, this.rewards = const []});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      rewards: List<String>.from(json['rewards']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'rewards': rewards,
    };
  }
}