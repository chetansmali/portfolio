import 'dart:convert';

class ProfileData {
  final String name;
  final String role;
  final String techLogoUrl;
  final String imagePath;

  ProfileData({
    this.name = "",
    this.role = "",
    this.techLogoUrl = "",
    this.imagePath = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'techLogoUrl': techLogoUrl,
      'imagePath': imagePath,
    };
  }

  factory ProfileData.fromJson(Map<String, dynamic> map) {
    return ProfileData(
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      techLogoUrl: map['techLogoUrl'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());

  factory ProfileData.fromRawJson(String source) => ProfileData.fromJson(json.decode(source));
}
