import 'dart:convert';

class ExperienceData {
  final String clientName;
  final String date;
  final String summary;
  final String logoUrl;
  final List<_ExperienceTask> notableTasks;

  ExperienceData({
    this.clientName = "",
    this.date = "",
    this.summary = "",
    this.logoUrl = "",
    this.notableTasks = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'date': date,
      'summary': summary,
      'logoUrl': logoUrl,
      'notableTasks': notableTasks.map((x) => x.toJson()).toList(),
    };
  }

  factory ExperienceData.fromJson(Map<String, dynamic> map) {
    return ExperienceData(
      clientName: map['clientName'] ?? '',
      date: map['date'] ?? '',
      summary: map['summary'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
      notableTasks: List<_ExperienceTask>.from(map['notableTasks']?.map((x) => _ExperienceTask.fromJson(x))),
    );
  }

  String toRawJson() => json.encode(toJson());

  factory ExperienceData.fromRawJson(String source) => ExperienceData.fromJson(json.decode(source));
}

class _ExperienceTask {
  final String name;
  final String description;

  _ExperienceTask({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory _ExperienceTask.fromJson(Map<String, dynamic> map) {
    return _ExperienceTask(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toRawJson() => json.encode(toJson());
}
