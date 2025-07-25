import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/education_card.dart';
import '../constants/colors.dart';
import '../models/portfolio_data.dart';
import '../providers/theme_provider.dart';
import '../utils/utils.dart';
import '../widgets/custom_button.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/skill_card.dart';
import '../widgets/certification_card.dart';
import '../widgets/experience_card.dart'; // Assuming this is implemented similarly

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GlobalKey> _sectionKeys = List.generate(7, (_) => GlobalKey());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeProvider.currentTheme,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: NavBar(
          sectionKeys: _sectionKeys,
          scrollController: _scrollController,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _buildAboutSection(context, _sectionKeys[0]),
              const SizedBox(height: 64),
              _buildDivider(context),
              _buildExperienceSection(context, _sectionKeys[1]),
              const SizedBox(height: 64),
              _buildDivider(context),
              _buildProjectsSection(context, _sectionKeys[2]),
              const SizedBox(height: 64),
              _buildDivider(context),
              // EducationCard(sectionKey: _sectionKeys[3]),
              _buildSkillsSection(context, _sectionKeys[3]),
              const SizedBox(height: 64),
              _buildDivider(context),
              _buildEducationSection(context, _sectionKeys[4]),
              const SizedBox(height: 64),
              _buildDivider(context),
              // _buildExperienceSection
              _buildCertificationsSection(context, _sectionKeys[5]),
              const SizedBox(height: 64),
              _buildDivider(context),
              ContactSection(sectionKey: _sectionKeys[6]),
              const SizedBox(height: 64), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper for subtle blue divider
  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width * 0.8,
      color: AppColors.secondary.withOpacity(0.2),
    );
  }

  Widget _buildAboutSection(BuildContext context, GlobalKey key) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      key: key,
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor,
            colorScheme.secondary.withOpacity(0.05),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: isMobile ? double.infinity : 1200),
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isMobile
                    ? Column(children: _buildProfileContent(isMobile))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildProfileContent(isMobile),
                      ),
                const SizedBox(height: 48),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: colorScheme.secondary.withOpacity(0.6),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 12,
                  shadowColor: colorScheme.secondary.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.cardColor,
                          colorScheme.secondary.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.auto_stories,
                                color: colorScheme.secondary, size: 32),
                            const SizedBox(width: 16),
                            Text(
                              'My Journey',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          portfolioData.detailedAbout,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: portfolioData.journeyPoints
                              .map((point) => _buildJourneyPoint(
                                  point.title, point.description))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJourneyPoint(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_outline,
            color: AppColors.secondary, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method for profile content
  List<Widget> _buildProfileContent(bool isMobile) {
    return [
      CircleAvatar(
        backgroundImage: AssetImage(portfolioData.avatarPath),
        radius: isMobile ? 60 : 100, // Larger on desktop
      ),
      SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 24 : 0),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            portfolioData.name,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: isMobile ? 36 : 56),
          ),
          Text(
            portfolioData.currentPosition,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 18 : 28, color: Colors.grey[600]),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: isMobile ? double.infinity : 600),
            child: Text(
              portfolioData.shortBio,
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: isMobile ? 16 : 20, height: 1.6),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment:
                isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              CustomButton(
                text: 'Get in touch',
                color: AppColors.secondary,
                onPressed: () {
                  Scrollable.ensureVisible(
                    _sectionKeys[6].currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const SizedBox(width: 16),
              const CustomButton(
                text: 'View Resume',
                color: AppColors.secondary,
                onPressed: Utils.launchResume,
                icon: Icons.download,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  Widget _buildProjectsSection(BuildContext context, GlobalKey key) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1200 ? 3 : (width > 600 ? 2 : 1);
    final horizontalPadding =
        width > 1200 ? 64.0 : 32.0; // Increased padding on desktop

    return Container(
      key: key,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 32),
      child: Column(
        children: [
          const Text('My Projects',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio:
                  2.0, // Wider ratio for horizontal cards (adjust as needed)
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: portfolioData.projects.length,
            itemBuilder: (context, index) =>
                ProjectCard(project: portfolioData.projects[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context, GlobalKey key) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount =
        width > 1200 ? 5 : (width > 600 ? 3 : 2); // More items on desktop
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 800),
        child: Column(
          children: [
            Text(
              'My Skills',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 16),
            Text(
              portfolioData.skillsDescription,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1.3, // Adjusted for better fit
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: portfolioData.skills.length,
              itemBuilder: (context, index) =>
                  SkillCard(skill: portfolioData.skills[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context, GlobalKey key) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        children: [
          Text(
            'Education',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: AppColors.secondary),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: EducationCard(),
          )
        ],
      ),
    );
  }

  Widget _buildCertificationsSection(BuildContext context, GlobalKey key) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1200 ? 4 : (width > 600 ? 2 : 1);
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 800),
        child: Column(
          children: [
            Text(
              'Certifications',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1.6,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: portfolioData.certifications.length,
              itemBuilder: (context, index) => CertificationCard(
                certification: portfolioData.certifications[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context, GlobalKey key) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 800),
        child: Column(
          children: [
            Text(
              'My Experience',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: portfolioData.experiences.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ExperienceCard(
                    experience: portfolioData.experiences[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
