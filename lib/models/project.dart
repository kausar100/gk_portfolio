class Project {
  final String title;
  final String description;
  final String? imageUrl;
  final String? url;
  final List<String> techStack;

  Project({
    required this.title,
    required this.description,
    this.imageUrl,
    this.url,
    required this.techStack,
  });
}

final List<Project> myProjects = [
  Project(
    title: 'LPG Solutions',
    description:
        'An e-commerce app for ordering gas cylinders and tracking deliveries. Features easy login, simple order management, live status updates, and a responsive interface.',
    url: 'https://play.google.com/store/apps/details?id=com.omeralpg.lpgsolution&hl=en',
    techStack: ['Flutter', 'Dart', 'BLoC', 'REST API'],
  ),
  Project(
    title: 'Sales App',
    description:
        'A Flutter sales app for managing client visits, deliveries, payments, cheque receipts, and reports. Includes auto-fetch of location, image attachments with compression, and direct Odoo integration.',
    techStack: ['Flutter', 'GetX', 'Odoo Integration', 'Location API'],
  ),
  Project(
    title: 'Live Match Android App',
    description:
        'A Kotlin & Jetpack Compose app with Firebase for real-time nearby user detection. Users can send requests, chat instantly once accepted, and receive notifications.',
    techStack: ['Kotlin', 'Jetpack Compose', 'Firebase', 'MVVM'],
  ),
  Project(
    title: 'Service Provider App',
    description:
        'An offline-first Flutter app for recording AI and health services, with scheduling and automatic local notifications. Supports Firebase push notifications.',
    techStack: ['Flutter', 'Offline-first', 'Firebase', 'Local Notifications'],
  ),
  Project(
    title: 'Attendance Management App',
    description:
        'An attendance app built with Flutter using Provider, supporting both physical and WFH attendance with local reminders.',
    techStack: ['Flutter', 'Provider', 'Local Notifications'],
  ),
  Project(
    title: 'Ogreem',
    description:
        'An Android app that lets employees access their earned salary on demand. Uses Firebase Authentication and FCM for notifications.',
    techStack: ['Flutter', 'Firebase', 'Salary On-demand'],
  ),
  Project(
    title: 'Meal Management App',
    description:
        'A personal app for managing meals and shopping for mess members. Built with Kotlin and Jetpack Compose, using MVVM and Firebase Firestore.',
    techStack: ['Kotlin', 'Jetpack Compose', 'MVVM', 'Firestore'],
  ),
];
