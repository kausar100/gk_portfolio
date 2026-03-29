import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'responsive_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("My Skills"),
          const SizedBox(height: 48),
          ResponsiveWidget.isDesktop(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildSkillCategory("Languages", ["Dart", "Kotlin", "Java"])),
                    Expanded(child: _buildSkillCategory("Mobile Frameworks", ["Flutter", "Jetpack Compose", "Native Android"])),
                    Expanded(child: _buildSkillCategory("State Management", ["BLoC", "Provider", "GetX", "Cubit"])),
                  ],
                )
              : Column(
                  children: [
                    _buildSkillCategory("Languages", ["Dart", "Kotlin", "Java"]),
                    _buildSkillCategory("Mobile Frameworks", ["Flutter", "Jetpack Compose", "Native Android"]),
                    _buildSkillCategory("State Management", ["BLoC", "Provider", "GetX", "Cubit"]),
                  ],
                ),
          const SizedBox(height: 40),
          ResponsiveWidget.isDesktop(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildSkillCategory("Architecture", ["Clean Architecture", "MVVM", "Repository Pattern"])),
                    Expanded(child: _buildSkillCategory("Tools & DB", ["Git", "GitHub", "Firebase", "SQLite", "Room", "Floor"])),
                    Expanded(child: _buildSkillCategory("Other", ["RESTful APIs", "Firebase Auth", "FCM", "CI/CD"])),
                  ],
                )
              : Column(
                  children: [
                    _buildSkillCategory("Architecture", ["Clean Architecture", "MVVM", "Repository Pattern"]),
                    _buildSkillCategory("Tools & DB", ["Git", "GitHub", "Firebase", "SQLite", "Room", "Floor"]),
                    _buildSkillCategory("Other", ["RESTful APIs", "Firebase Auth", "FCM", "CI/CD"]),
                  ],
                ),
        ],
      ),
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

  Widget _buildSkillCategory(String name, List<String> skills) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppConstants.kHeaderStyle.copyWith(fontSize: 20, color: AppConstants.kSecondaryColor)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => _buildSkillChip(skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      backgroundColor: AppConstants.kCardColor,
      label: Text(skill, style: const TextStyle(color: AppConstants.kTextColor)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppConstants.kPrimaryColor.withOpacity(0.3)),
      ),
    );
  }
}
