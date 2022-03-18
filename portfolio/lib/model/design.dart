import 'dart:convert';

class Design {
  String name;
  String imageUrl;
  String description;
  String theme;
  Design({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.theme,
  });

  Design copyWith({
    String? name,
    String? imageUrl,
    String? description,
    String? theme,
  }) {
    return Design(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      theme: theme ?? this.theme,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'theme': theme,
    };
  }

  factory Design.fromMap(Map<String, dynamic> map) {
    return Design(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      theme: map['theme'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Design.fromJson(String source) => Design.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Design(name: $name, imageUrl: $imageUrl, description: $description, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Design &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.theme == theme;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        theme.hashCode;
  }
}
