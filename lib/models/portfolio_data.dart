import 'package:flutter/material.dart';

class PortfolioData {
  // About Section
  final String name = 'John Doe';
  final String avatarPath = 'assets/images/profile.png';
  final String currentPosition = 'Software Engineer';
  final String shortBio =
      'Passionate software engineer with a love for creative problem solving and building impactful products.';
  final String detailedAbout =
      'I am a dedicated developer with experience in mobile and web development. My work focuses on delivering high-quality solutions with an emphasis on readable code and teamwork. Always eager to learn and take on new challenges.';
  final String resumeLink =
      'https://drive.google.com/file/d/your_resume_id/view';

  // Projects Section
  final List<Project> projects = [
    Project(
      title: 'Taskly',
      imagePath: 'assets/images/taskly.png',
      techStack: ['Flutter', 'Dart', 'Firebase'],
      shortDescription: 'A productivity app for managing daily tasks.',
      detailedDescription:
          'Taskly helps users manage their tasks efficiently with features like reminders, priority labels, and cloud sync. Built with Flutter and Firebase for cross-platform support.',
      githubLink: 'https://github.com/johndoe/taskly',
      liveDemoLink: null,
      galleryImages: [
        'assets/images/taskly_gal1.png',
        'assets/images/taskly_gal2.png'
      ],
    ),
    Project(
      title: 'Weatherly',
      imagePath: 'assets/images/weatherly.png',
      techStack: ['React', 'Node.js', 'OpenWeatherMap API'],
      shortDescription: 'A web app displaying real-time weather updates.',
      detailedDescription:
          'Weatherly allows users to search for weather information in any city. Built using React for the frontend, Node.js backend, and uses OpenWeatherMap\'s REST API.',
      githubLink: 'https://github.com/johndoe/weatherly',
      liveDemoLink: null,
      galleryImages: [],
    ),
    Project(
      title: 'FitTrack',
      imagePath: 'assets/images/fittrack.png',
      techStack: ['Kotlin', 'SQLite', 'Android'],
      shortDescription: 'Android app for tracking workouts and nutrition.',
      detailedDescription:
          'FitTrack enables users to record workouts, set goals, and monitor nutritional intake. All data is stored locally via SQLite for privacy and performance.',
      githubLink: 'https://github.com/johndoe/fittrack',
      liveDemoLink: null,
      galleryImages: [],
    ),
  ];

  // Skills Section
  final String skillsDescription =
      'Equipped with a broad array of programming languages and frameworks.';

  final List<Skill> skills = [
    Skill(
      name: 'Flutter',
      icon: Icons.flutter_dash,
      level: 'Advanced',
      frameworks: 'Provider, Riverpod',
    ),
    Skill(
      name: 'Dart',
      icon: Icons.code,
      level: 'Advanced',
      frameworks: 'Streams, Null Safety',
    ),
    Skill(
      name: 'JavaScript',
      icon: Icons.javascript,
      level: 'Intermediate',
      frameworks: 'React, Node.js',
    ),
    Skill(
      name: 'Python',
      icon: Icons.code,
      level: 'Intermediate',
      frameworks: 'Django, Pandas',
    ),
    Skill(
      name: 'SQL',
      icon: Icons.storage,
      level: 'Intermediate',
      frameworks: 'MySQL, SQLite',
    ),
  ];

  // Education Section
  final Education education = Education(
    degree: 'B.Sc. in Computer Science',
    university: 'Sample State University',
    duration: '2018 - 2022',
    description:
        'Focused on software development, algorithms, and database management. Graduated with honors.',
  );

  // Certifications Section
  final List<Certification> certifications = [
    Certification(
      issuer: 'Coursera',
      title: 'Flutter Development Bootcamp',
      date: '2022',
      link: 'https://coursera.org/certificates/flutter-sample',
    ),
    Certification(
      issuer: 'Udemy',
      title: 'JavaScript: The Advanced Concepts',
      date: '2021',
      link: 'https://udemy.com/certificates/js-advanced-sample',
    ),
    Certification(
      issuer: 'edX',
      title: 'Python for Everybody',
      date: '2020',
      link: 'https://edx.org/certificates/python-sample',
    ),
  ];

  // Experience Section
  final List<Experience> experiences = [
    Experience(
      companyName: 'Initech Software',
      role: 'Frontend Developer',
      location: 'Remote',
      timeline: 'Jan 2023 - Present',
      logoPath: 'assets/images/initech_logo.png',
      descriptionPoints: [
        'Developed and maintained a suite of Flutter mobile apps.',
        'Collaborated with designers to implement pixel-perfect UIs.',
        'Wrote unit and integration tests to ensure app reliability.',
      ],
    ),
  ];

  // Journey Section
  final List<JourneyPoint> journeyPoints = [
    JourneyPoint('Coding Bootcamp Graduate',
        'Completed an intensive software development bootcamp with over 500 hours of practical coding.'),
    JourneyPoint('Open Source Contributor',
        'Contributed bug fixes and features to several open source projects.'),
    JourneyPoint('Tech Meetup Speaker',
        'Presented talks on cross-platform mobile development in local tech meetups.'),
  ];

  // Contact Section
  final String email = 'john.doe@gmail.com';
  final String phone = '555-123-4567';
  final String location = 'Sample City, Country';

  // Links
  final String linkedinLink = 'https://linkedin.com/in/johndoe';
  final String githubLink = 'https://github.com/johndoe';
  final String leetcodeLink = 'https://leetcode.com/johndoe';
  final String resumePath = 'assets/resume.pdf';
}

class Project {
  final String title;
  final String imagePath;
  final List<String> techStack;
  final String shortDescription;
  final String detailedDescription;
  final String githubLink;
  final String? liveDemoLink;
  final List<String> galleryImages;

  Project({
    required this.title,
    required this.imagePath,
    required this.techStack,
    required this.shortDescription,
    required this.detailedDescription,
    required this.githubLink,
    this.liveDemoLink,
    required this.galleryImages,
  });
}

class Skill {
  final String name;
  final IconData icon;
  final String level;
  final String frameworks;

  Skill({
    required this.name,
    required this.icon,
    required this.level,
    required this.frameworks,
  });
}

class Education {
  final String degree;
  final String university;
  final String duration;
  final String description;

  Education({
    required this.degree,
    required this.university,
    required this.duration,
    required this.description,
  });
}

class Certification {
  final String title;
  final String issuer;
  final String date;
  final String link;

  Certification({
    required this.issuer,
    required this.title,
    required this.date,
    required this.link,
  });
}

class Experience {
  final String companyName;
  final String role;
  final String location;
  final String timeline;
  final String logoPath;
  final List<String> descriptionPoints;

  Experience({
    required this.companyName,
    required this.role,
    required this.location,
    required this.timeline,
    required this.logoPath,
    required this.descriptionPoints,
  });
}

class JourneyPoint {
  final String title;
  final String description;

  JourneyPoint(this.title, this.description);
}

// Singleton instance for easy access
final portfolioData = PortfolioData();
