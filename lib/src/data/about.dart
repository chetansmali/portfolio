import 'dart:convert';

class AboutData {
  final String description;
  final String more;

  AboutData({
    this.description = "",
    this.more = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'more': more,
    };
  }

  factory AboutData.fromJson(Map<String, dynamic> map) {
    return AboutData(
      description: map['description'] ?? '',
      more: map['more'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());

  factory AboutData.fromRawJson(String source) => AboutData.fromJson(json.decode(source));
}
