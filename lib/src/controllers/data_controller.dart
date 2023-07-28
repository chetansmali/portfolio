import 'package:hrushikesh_portfolio/src/controllers/core/interface.dart';
import 'package:hrushikesh_portfolio/src/data/about.dart';
import 'package:hrushikesh_portfolio/src/data/experience.dart';
import 'package:hrushikesh_portfolio/src/data/profile.dart';
import 'package:hrushikesh_portfolio/src/data/project.dart';
import 'package:hrushikesh_portfolio/src/data/repositories/json_repository.dart';
import 'package:hrushikesh_portfolio/src/data/skill.dart';

class DataController extends Controller<DataController> {
  DataController(this.jsonRepository);

  final JsonRepository jsonRepository;

  ProfileData profileData = ProfileData();
  AboutData aboutData = AboutData();
  List<ExperienceData> experiences = [];
  List<SkillData> skills = [];
  List<ProjectData> projects = [];

  @override
  void setState({
    ProfileData? profileData,
    AboutData? aboutData,
    List<ExperienceData>? experiences,
    List<SkillData>? skills,
    List<ProjectData>? projects,
  }) {
    this.profileData = profileData ?? this.profileData;
    this.aboutData = aboutData ?? this.aboutData;
    this.experiences = experiences ?? this.experiences;
    this.skills = skills ?? this.skills;
    this.projects = projects ?? this.projects;

    updateStream(this);
  }

  Future<void> loadAllData() async {
    final profile = await jsonRepository.getData("assets/data/profile.json");
    final about = await jsonRepository.getData("assets/data/about_me.json");
    final experience = await jsonRepository.getData("assets/data/experience.json");
    final skills = await jsonRepository.getData("assets/data/skills.json");
    final portfolio = await jsonRepository.getData("assets/data/portfolio.json");
    setState(
      profileData: ProfileData.fromJson(profile),
      aboutData: AboutData.fromJson(about),
      experiences: (experience["clients"] as List).map((e) => ExperienceData.fromJson(e)).toList(),
      skills: (skills["skills"] as List).map((e) => SkillData.fromJson(e)).toList(),
      projects: (portfolio["projects"] as List).map((e) => ProjectData.fromJson(e)).toList(),
    );
  }
}
