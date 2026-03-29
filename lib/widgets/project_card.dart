import 'package:flutter/material.dart';
import '../models/project.dart';
import '../utils/constants.dart';
import 'responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppConstants.kCardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppConstants.kPrimaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppConstants.kPrimaryColor.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.project.title,
              style: AppConstants.kHeaderStyle.copyWith(fontSize: 24, color: AppConstants.kSecondaryColor),
            ),
            const SizedBox(height: 12),
            Text(
              widget.project.description,
              style: AppConstants.kSubHeaderStyle.copyWith(color: AppConstants.kTextColor, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.techStack
                  .map((tech) => _buildTechChip(tech))
                  .toList(),
            ),
            if (!ResponsiveWidget.isMobile(context)) const Spacer(),
            if (ResponsiveWidget.isMobile(context)) const SizedBox(height: 20),
            if (widget.project.url != null)
              TextButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.project.url!);
                  if (!await launchUrl(uri)) {
                    debugPrint('Could not launch ${widget.project.url}');
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("View Source", style: TextStyle(color: AppConstants.kPrimaryColor)),
                    const SizedBox(width: 4),
                    const Icon(Icons.open_in_new, size: 16, color: AppConstants.kPrimaryColor),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppConstants.kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppConstants.kPrimaryColor.withOpacity(0.3)),
      ),
      child: Text(
        tech,
        style: const TextStyle(color: AppConstants.kPrimaryColor, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
