import 'dart:convert';

class ProjectData {
  final String name;
  final String previewLink;
  final List<String> tags;
  final String previewImage;
  final String fullDescription;

  ProjectData({
    required this.name,
    required this.previewLink,
    required this.tags,
    required this.previewImage,
    required this.fullDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'previewLink': previewLink,
      'tags': tags,
      'previewImage': previewImage,
      'fullDescription': fullDescription,
    };
  }

  factory ProjectData.fromJson(Map<String, dynamic> map) {
    return ProjectData(
      name: map['name'] ?? '',
      previewLink: map['previewLink'] ?? '',
      tags: List<String>.from(map['tags']),
      previewImage: map['previewImage'] ?? '',
      fullDescription: map['fullDescription'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());

  factory ProjectData.fromRawJson(String source) => ProjectData.fromJson(json.decode(source));
}
