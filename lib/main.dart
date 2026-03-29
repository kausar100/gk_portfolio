import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils/constants.dart';
import 'widgets/responsive_widget.dart';
import 'widgets/hero_section.dart';
import 'widgets/project_card.dart';
import 'widgets/skills_section.dart';
import 'models/project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Md. Golam Kaochhar | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppConstants.kBackgroundColor,
        primaryColor: AppConstants.kPrimaryColor,
        textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ResponsiveWidget.isMobile(context) ? _buildDrawer() : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: _buildAppBar(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _homeKey),
            _buildProjectsSection(),
            SkillsSection(key: _skillsKey),
            _buildExperienceSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: AppConstants.kBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "GK.",
          style: AppConstants.kHeaderStyle.copyWith(color: AppConstants.kSecondaryColor),
        ),
      ),
      actions: ResponsiveWidget.isMobile(context)
          ? null
          : [
              _buildNavButton("Home", _homeKey),
              _buildNavButton("Projects", _projectsKey),
              _buildNavButton("Skills", _skillsKey),
              _buildNavButton("Experience", _experienceKey),
              const SizedBox(width: 40),
            ],
    );
  }

  Widget _buildNavButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(
        title,
        style: const TextStyle(color: AppConstants.kTextColor, fontSize: 16),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppConstants.kBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "GK.",
                style: AppConstants.kHeaderStyle.copyWith(color: AppConstants.kSecondaryColor),
              ),
            ),
          ),
          _buildDrawerItem("Home", _homeKey),
          _buildDrawerItem("Projects", _projectsKey),
          _buildDrawerItem("Skills", _skillsKey),
          _buildDrawerItem("Experience", _experienceKey),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, GlobalKey key) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppConstants.kTextColor)),
      onTap: () {
        Navigator.pop(context);
        _scrollTo(key);
      },
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      key: _projectsKey,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 50,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("Featured Projects"),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = ResponsiveWidget.isDesktop(context) ? 3 : (ResponsiveWidget.isTablet(context) ? 2 : 1);
              if (crossAxisCount == 1) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myProjects.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 24),
                  itemBuilder: (context, index) => ProjectCard(project: myProjects[index]),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.1,
                ),
                itemCount: myProjects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: myProjects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      key: _experienceKey,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      width: double.infinity,
      color: AppConstants.kCardColor.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("Work Experience"),
          const SizedBox(height: 48),
          _buildExperienceItem(
            "Software Engineer / Mobile App Developer",
            "Mir Info Systems Ltd.",
            "Oct 2022 - Present",
            [
              "Develop and maintain high-quality Android apps with Flutter and Native Android.",
              "Design UI components using Jetpack Compose for modern layouts.",
              "Architect scalable apps using Clean Architecture, MVVM, and BLoC.",
              "Integrate RESTful APIs for secure backend communication.",
              "Offline-first data strategy with Room and Floor databases.",
            ],
          ),
          const SizedBox(height: 40),
          _buildSectionHeader("Education"),
          const SizedBox(height: 48),
          _buildExperienceItem(
            "B.Sc. in Computer Science & Engineering",
            "Khulna University of Engineering & Technology (KUET)",
            "March 2017 - April 2022",
            [
              "Graduated with CGPA 3.69 / 4.00",
              "Passionate about Data Structures, Algorithms, and Mobile Development.",
              "Dean's Award Recipient.",
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(String role, String company, String period, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                role,
                style: AppConstants.kHeaderStyle.copyWith(fontSize: 22, color: AppConstants.kSecondaryColor),
              ),
            ),
            Text(period, style: AppConstants.kSubHeaderStyle),
          ],
        ),
        const SizedBox(height: 4),
        Text(company, style: AppConstants.kHeaderStyle.copyWith(fontSize: 18)),
        const SizedBox(height: 16),
        ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• ", style: TextStyle(color: AppConstants.kPrimaryColor, fontSize: 18)),
                  Expanded(child: Text(detail, style: AppConstants.kSubHeaderStyle.copyWith(color: AppConstants.kTextColor))),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppConstants.kHeaderStyle.copyWith(fontSize: 40)),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          color: AppConstants.kPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const Divider(color: AppConstants.kTextSecondaryColor),
          const SizedBox(height: 32),
          Text(
            "Get in Touch",
            style: AppConstants.kHeaderStyle.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 16),
          Text(
            "kausar.cse16@gmail.com | 01315783246",
            style: AppConstants.kSubHeaderStyle,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.link, "https://www.linkedin.com/in/md-golam-kausar-7a34511b0/"),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.code, "https://github.com/kausar100"),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            "© 2026 Md. Golam Kaochhar. Built with Flutter.",
            style: AppConstants.kSubHeaderStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: AppConstants.kTextColor, size: 30),
      onPressed: () => _launchURL(url),
    );
  }
}
