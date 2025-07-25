import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/portfolio_data.dart'; // Adjust if ProjectModel is separate
import '../widgets/project_model.dart'; // Assuming this exists

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
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ProjectModal(project: widget.project),
          );
        },
        child: Hero(
          tag: 'project-${widget.project.title}',
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 160, // Fixed height for horizontal rectangle
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered
                    ? AppColors.secondary
                    : Theme.of(context).dividerColor.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                // Left: Image with rounded corners
                ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(16)),
                  child: SizedBox(
                    width: 160, // Fixed width for image
                    height: double.infinity, // Full card height
                    child: Image.asset(
                      widget.project.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 160),
                    ),
                  ),
                ),
                // Right: Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.project.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: widget.project.techStack
                              .map(
                                (tech) => GestureDetector(
                                  onTap: () {
                                    // Optional: Add tap action, e.g., show tech details
                                  },
                                  child: AnimatedScale(
                                    scale: _isHovered
                                        ? 1.05
                                        : 1.0, // Subtle scale on hover (requires _isHovered from parent MouseRegion)
                                    duration: const Duration(milliseconds: 200),
                                    child: Material(
                                      elevation: 3, // Soft elevation for depth
                                      shadowColor:
                                          AppColors.secondary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.secondary
                                                  .withOpacity(0.2),
                                              AppColors.secondary
                                                  .withOpacity(0.05)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(
                                              color: AppColors.secondary,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          child: Text(
                                            tech,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColors.secondary
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            widget.project.shortDescription,
                            style: const TextStyle(fontSize: 13),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon:
                                const FaIcon(FontAwesomeIcons.github, size: 20),
                            tooltip: 'View on GitHub',
                            onPressed: () async {
                              final url = Uri.parse(widget.project.githubLink);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Could not launch GitHub link')),
                                );
                              }
                            },
                          ),
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
}
