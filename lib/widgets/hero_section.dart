import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'responsive_widget.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: ResponsiveWidget.isDesktop(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildTextContent(context)),
                _buildProfilePlaceholder(),
              ],
            )
          : Column(
              children: [
                _buildProfilePlaceholder(),
                const SizedBox(height: 40),
                _buildTextContent(context, isCenter: true),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, {bool isCenter = false}) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm",
          style: AppConstants.kSubHeaderStyle.copyWith(color: AppConstants.kSecondaryColor),
        ),
        const SizedBox(height: 8),
        Text(
          "Md. Golam Kaochhar",
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: AppConstants.kHeaderStyle.copyWith(
            fontSize: ResponsiveWidget.isDesktop(context) ? 56 : 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Mobile Application Developer (Flutter & Native Android)",
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: AppConstants.kSubHeaderStyle.copyWith(
            fontSize: ResponsiveWidget.isDesktop(context) ? 24 : 18,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "I specialize in building high-quality, scalable mobile applications with Flutter and Native Android (Kotlin & Jetpack Compose). Passionate about creating seamless user experiences and professional architectural designs.",
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: AppConstants.kSubHeaderStyle.copyWith(color: AppConstants.kTextSecondaryColor),
        ),
      ],
    );
  }

  Widget _buildProfilePlaceholder() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: AppConstants.kCardColor,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: AppConstants.kPrimaryColor, width: 4),
        boxShadow: [
          BoxShadow(
            color: AppConstants.kPrimaryColor.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.asset(
            'assets/profile.jpg',
            fit: BoxFit.cover,
          ),
        )
      ),
    );
  }
}
