import 'dart:convert';

class User {
  final String name;
  final String occupation;
  final int age;
  final String stack;
  final String profileUrl;
  final String aboutMe;
  final String resume;
  User({
    required this.name,
    required this.occupation,
    required this.age,
    required this.stack,
    required this.profileUrl,
    required this.aboutMe,
    required this.resume,
  });

  User copyWith({
    String? name,
    String? occupation,
    int? age,
    String? stack,
    String? profileUrl,
    String? aboutMe,
    String? resume,
  }) {
    return User(
      name: name ?? this.name,
      occupation: occupation ?? this.occupation,
      age: age ?? this.age,
      stack: stack ?? this.stack,
      profileUrl: profileUrl ?? this.profileUrl,
      aboutMe: aboutMe ?? this.aboutMe,
      resume: resume ?? this.resume,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'occupation': occupation});
    result.addAll({'age': age});
    result.addAll({'stack': stack});
    result.addAll({'profile_picture_url': profileUrl});
    result.addAll({'about_me': aboutMe});
    result.addAll({'resume': resume});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      occupation: map['occupation'] ?? '',
      age: map['age']?.toInt() ?? 0,
      stack: map['stack'] ?? '',
      profileUrl: map['profile_picture_url'] ?? '',
      aboutMe: map['about_me'] ?? '',
      resume: map['resume'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, occupation: $occupation, age: $age, stack: $stack, profile_picture_url: $profileUrl, aboutMe: $aboutMe, resume: $resume)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.occupation == occupation &&
        other.age == age &&
        other.stack == stack &&
        other.profileUrl == profileUrl &&
        other.aboutMe == aboutMe &&
        other.resume == resume;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        occupation.hashCode ^
        age.hashCode ^
        stack.hashCode ^
        profileUrl.hashCode ^
        aboutMe.hashCode ^
        resume.hashCode;
  }
}
