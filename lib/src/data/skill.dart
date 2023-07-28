import 'dart:convert';

class SkillData {
  final String name;
  final String description;
  final String techLogoPath;

  SkillData({
    required this.name,
    required this.description,
    required this.techLogoPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'techLogoPath': techLogoPath,
    };
  }

  factory SkillData.fromJson(Map<String, dynamic> map) {
    return SkillData(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      techLogoPath: map['techLogoPath'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());

  factory SkillData.fromRawJson(String source) => SkillData.fromJson(json.decode(source));
}
