import 'dart:convert';

class Project {
  final int id;
  final String name;
  final String description;
  final String keyContribution;
  final DateTime created;
  final DateTime updated;
  final String googleAppLinkUrl;
  final String appleAppLinkUrl;
  final String pictureUrl;
  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.keyContribution,
    required this.created,
    required this.updated,
    required this.googleAppLinkUrl,
    required this.appleAppLinkUrl,
    required this.pictureUrl,
  });

  Project copyWith({
    int? id,
    String? name,
    String? description,
    String? keyContribution,
    DateTime? created,
    DateTime? updated,
    String? googleAppLinkUrl,
    String? appleAppLinkUrl,
    String? pictureUrl,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      keyContribution: keyContribution ?? this.keyContribution,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      googleAppLinkUrl: googleAppLinkUrl ?? this.googleAppLinkUrl,
      appleAppLinkUrl: appleAppLinkUrl ?? this.appleAppLinkUrl,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'key_contribtion': keyContribution,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'google_app_link': googleAppLinkUrl,
      'apple_app_link': appleAppLinkUrl,
      'picture_url': pictureUrl,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      keyContribution: map['key_contribtion'] ?? '',
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      googleAppLinkUrl: map['google_app_link'] ?? '',
      appleAppLinkUrl: map['apple_app_link'] ?? '',
      pictureUrl: map['picture_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, keyContribution: $keyContribution, created: $created, updated: $updated, googleAppLinkUrl: $googleAppLinkUrl, appleAppLinkUrl: $appleAppLinkUrl, pictureUrl: $pictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.keyContribution == keyContribution &&
        other.created == created &&
        other.updated == updated &&
        other.googleAppLinkUrl == googleAppLinkUrl &&
        other.appleAppLinkUrl == appleAppLinkUrl &&
        other.pictureUrl == pictureUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        keyContribution.hashCode ^
        created.hashCode ^
        updated.hashCode ^
        googleAppLinkUrl.hashCode ^
        appleAppLinkUrl.hashCode ^
        pictureUrl.hashCode;
  }
}
