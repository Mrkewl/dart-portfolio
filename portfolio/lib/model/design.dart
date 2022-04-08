import 'dart:convert';

import 'package:collection/collection.dart';

class Design {
  String name;
  String imageUrl;
  String description;
  String theme;
  List<String> screenUrls;
  Design({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.theme,
    required this.screenUrls,
  });

  Design copyWith({
    String? name,
    String? imageUrl,
    String? description,
    String? theme,
    List<String>? screenUrls,
  }) {
    return Design(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      theme: theme ?? this.theme,
      screenUrls: screenUrls ?? this.screenUrls,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image_url': imageUrl});
    result.addAll({'description': description});
    result.addAll({'theme': theme});
    result.addAll({'screens_urls': screenUrls});

    return result;
  }

  factory Design.fromMap(Map<String, dynamic> map) {
    return Design(
      name: map['name'] ?? '',
      imageUrl: map['image_url'] ?? '',
      description: map['description'] ?? '',
      theme: map['theme'] ?? '',
      screenUrls: List<String>.from(map['screens_urls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Design.fromJson(String source) => Design.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Design(name: $name, image_url: $imageUrl, description: $description, theme: $theme, screens_urls: $screenUrls)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Design &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.theme == theme &&
        listEquals(other.screenUrls, screenUrls);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        theme.hashCode ^
        screenUrls.hashCode;
  }
}
