import 'dart:convert';

class User {
  final String name;
  final String occupation;
  final int age;
  final String stack;
  final String profileUrl;
  User({
    required this.name,
    required this.occupation,
    required this.age,
    required this.stack,
    required this.profileUrl,
  });

  User copyWith({
    String? name,
    String? occupation,
    int? age,
    String? stack,
    String? profileUrl,
  }) {
    return User(
      name: name ?? this.name,
      occupation: occupation ?? this.occupation,
      age: age ?? this.age,
      stack: stack ?? this.stack,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupation': occupation,
      'age': age,
      'stack': stack,
      'profileUrl': profileUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      occupation: map['occupation'] ?? '',
      age: map['age']?.toInt() ?? 0,
      stack: map['stack'] ?? '',
      profileUrl: map['profileUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, occupation: $occupation, age: $age, stack: $stack, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.occupation == occupation &&
        other.age == age &&
        other.stack == stack &&
        other.profileUrl == profileUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        occupation.hashCode ^
        age.hashCode ^
        stack.hashCode ^
        profileUrl.hashCode;
  }
}
