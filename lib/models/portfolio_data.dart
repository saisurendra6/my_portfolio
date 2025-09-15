import 'package:flutter/material.dart';

class PortfolioData {
  // About Section
  final String name = 'Kusam Sri Sai Surendra';
  final String avatarPath = 'assets/images/profile.png';
  final String currentPosition =
      'Android lead @ Google Developer Groups | CSE VRSEC\'26';
  final String shortBio =
      'B.Tech CSE student passionate about Flutter development, AI/ML, and building impactful software solutions.';
  final String detailedAbout =
      'I am a dedicated Computer Science Engineering student with hands-on experience in Flutter development, AI/ML, and cloud technologies. My work focuses on delivering innovative solutions with emphasis on performance optimization and user experience. Currently pursuing B.Tech at Velagapudi Ramakrishna Siddhartha Engineering College. Always eager to learn new technologies and contribute to meaningful projects.';
  final String resumeLink =
      'https://drive.google.com/file/d/your_resume_id/view';

  // Projects Section
  final List<Project> projects = [
    Project(
      title: 'AI Trolley',
      imagePath: 'assets/images/ai_trolley/trolley.jpg',
      techStack: [
        'YOLO',
        'Flutter',
        'GCP Functions',
        'Firebase',
        'IoT',
        'OpenCV',
      ],
      shortDescription:
          'Intelligent automated billing system with real-time object detection.',
      detailedDescription:
          'Developed an intelligent automated billing system using Python and Google Cloud Functions with YOLO object detection model for real-time product classification, reducing checkout time by 30%. Built a Flutter app with Firebase for secure authentication and billing history tracking.',
      githubLink: 'https://github.com/saisurendra6/ai_trolley',
      liveDemoLink: null,
      galleryImages: [
        'assets/images/ai_trolley/trolley.jpg',
        'assets/images/ai_trolley/home.jpg',
        'assets/images/ai_trolley/bill.jpg',
      ],
    ),
    Project(
      title: 'ToolZ',
      imagePath: 'assets/images/toolz/toolz_home1.jpg',
      techStack: ['Flutter', 'Dart', 'Android Java', 'SQLite'],
      shortDescription:
          'Privacy-first Flutter app for notification management and WhatsApp utilities.',
      detailedDescription:
          'Privacy-first Flutter app capturing full notification history via NotificationListenerService and Method-Channel, featuring fast search, filters, bulk actions, and analytics - data stored locally in SQLite. WhatsApp utilities for status viewing/downloading and direct messaging with Material 3 theming.',
      githubLink: 'https://github.com/saisurendra6/toolz',
      liveDemoLink: null,
      galleryImages: [
        'assets/images/toolz/toolz_home1.jpg',
        'assets/images/toolz/toolz_whatsapp_status.jpg',
        'assets/images/toolz/toolz_notifications_history.jpg',
        'assets/images/toolz/toolz_notifications_home.jpg',
      ],
    ),
    Project(
      title: 'News Research Tool',
      imagePath: 'assets/images/news_research.png',
      techStack: ['Python', 'LangChain', 'FAISS', 'OpenAI'],
      shortDescription:
          'RAG system for financial news analysis using LangChain.',
      detailedDescription:
          'Designed and implemented a Retrieval-Augmented Generation (RAG) system for financial news analysis using LangChain, enabling users to extract and analyze content from article URLs and text files. Integrated OpenAI embeddings and ChatGPT for intelligent content processing.',
      githubLink: 'https://github.com/saisurendra6/news_research_tool',
      liveDemoLink: null,
      galleryImages: [],
    ),
  ];

  // Skills Section
  final String skillsDescription =
      'Equipped with diverse programming languages, frameworks, and cloud technologies for full-stack development.';

  final List<Skill> skills = [
    Skill(
      name: 'Flutter',
      icon: Icons.flutter_dash,
      level: 'Advanced',
      frameworks: 'Firebase, State Management (Provider, BLoC)',
    ),
    Skill(
      name: 'Dart',
      icon: Icons.code,
      level: 'Intermediate',
      frameworks: 'Streams, Async Programming',
    ),
    Skill(
      name: 'Python',
      icon: Icons.code,
      level: 'Intermediate',
      frameworks: 'LangChain, OpenCV, Flask',
    ),
    Skill(
      name: 'Java',
      icon: Icons.coffee,
      level: 'Intermediate',
      frameworks: 'Android Development',
    ),
    Skill(
      name: 'SQL',
      icon: Icons.storage,
      level: 'Intermediate',
      frameworks: 'SQLPLUS',
    ),
    Skill(
      name: 'Google Cloud Platform (GCP)',
      icon: Icons.cloud,
      level: 'Intermediate',
      frameworks: 'Cloud Functions, Firestore, Firebase',
    ),
    Skill(
      name: 'Amazon Web Services (AWS)',
      icon: Icons.cloud_done,
      level: 'Intermediate',
      frameworks: 'VPS, S3, EC2',
    ),
    Skill(
      name: 'C',
      icon: Icons.code,
      level: 'Intermediate',
      frameworks: '',
    ),
  ];

  // Education Section
  final Education education = Education(
    degree: 'B.Tech in Computer Science Engineering',
    university: 'Velagapudi Ramakrishna Siddhartha Engineering College',
    duration: '2022 - 2026',
    description:
        'Currently pursuing Bachelor of Technology in Computer Science Engineering with a CGPA of 8.29. Focused on software development, artificial intelligence, and cloud computing technologies.',
  );

  // Certifications Section
  final List<Certification> certifications = [
    Certification(
      issuer: 'Google Cloud Platform',
      title: 'Associate Cloud Engineer',
      date: '2025',
      link:
          'https://www.credly.com/badges/770ca8ce-173e-49ae-a4f1-c59cd3d1ecd1/public_url',
    ),
    Certification(
      issuer: 'APSSDC',
      title: 'AWS - Cloud Computing',
      date: '2024',
      link:
          'https://drive.google.com/file/d/1_CWAAI-nvnLslmvzdDR2ycG31fNQYvP8/view',
    ),
    Certification(
      issuer: 'Cisco',
      title: 'Ethical Hacker',
      date: '2025',
      link:
          'https://www.credly.com/badges/1714166d-6574-442c-87e3-75138484763c/public_url',
    ),
    Certification(
      issuer: 'Harvard University (EdX)',
      title: 'CS109x',
      date: '2024',
      link:
          'https://courses.edx.org/certificates/15b3c5297b7340debffc4ed200dcd4e8',
    ),
    Certification(
      issuer: 'Udemy',
      title: 'Flutter & Dart - The Complete Guide',
      date: '2025',
      link:
          'https://www.udemy.com/certificate/UC-b29cdb91-f7ff-4cc6-bfa0-d9ba1f5df9e0/',
    ),
    Certification(
      issuer: 'Cisco',
      title: 'CCNAv7',
      date: '2024',
      link:
          'https://www.credly.com/badges/587e6f02-4ee3-4aed-8f01-1e39795665e8/public_url',
    ),
  ];

  // Experience Section
  final List<Experience> experiences = [
    Experience(
      companyName: 'Solar Buyer',
      role: 'Software Development Intern',
      location: 'Remote',
      timeline: 'June - Aug 2025',
      logoPath: 'assets/images/solar_buyer_logo.png',
      descriptionPoints: [
        'Developed and deployed a responsive Flutter web application using Dart, integrating REST APIs for a solar proposal assistant chatbot.',
        'Optimized performance across desktop, tablet, and mobile browsers.',
        'Integrated OpenAI Assistants API to handle file uploads and process responses.',
        'Gained hands-on experience with API integration, JSON data handling, and end-to-end front-end/backend communication.',
      ],
    ),
  ];

  // Journey Section
  final List<JourneyPoint> journeyPoints = [
    JourneyPoint('GDG Android Lead',
        'Led and organized 5+ tech events, including hackathons and workshops, impacting 100+ students at SAHE since October 2024.'),
    JourneyPoint('NSS Lead',
        'Coordinated service projects and managed teams at SAHE since October 2023, developing leadership and community service skills.'),
    JourneyPoint('AI Hackathon Volunteer',
        'Served as Co-lead and Accommodation Lead for AI autonomous Hackathon at SAHE in February 2025.'),
    JourneyPoint('Academic Excellence',
        'Maintained strong academic performance with 96% in SSC, 91.8% in Intermediate, and current CGPA of 8.29 in B.Tech.'),
  ];

  // Contact Section
  final String email = 'saisurendra.kusam@gmail.com';
  final String phone = '9615567555';
  final String location = 'Vijayawada, India';

  // Links
  final String linkedinLink =
      'https://www.linkedin.com/in/sri-sai-surendra-kusam/';
  final String githubLink = 'https://github.com/saisurendra6';
  final String leetcodeLink = 'https://leetcode.com/u/saisurendra06/';
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
