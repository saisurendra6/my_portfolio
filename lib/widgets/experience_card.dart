import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/portfolio_data.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.secondary
                : theme.dividerColor.withOpacity(0.2),
            width: 2,
          ),
          gradient: LinearGradient(
            // Added gradient for awesome look
            colors: [
              theme.cardColor,
              theme.cardColor.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    // Inner glow for extra awesomeness
                    color: AppColors.secondary.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildContent(theme, isMobile),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.experience.logoPath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.business,
                  size: 100,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.experience.companyName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.experience.role,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: theme.iconTheme.color),
                      const SizedBox(width: 4),
                      Text(
                        widget.experience.location,
                        style:
                            theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (!isMobile)
              Text(
                widget.experience.timeline,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (isMobile)
          Text(
            widget.experience.timeline,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        Divider(
          color: theme.dividerColor.withOpacity(0.5),
          thickness: 1,
        ),
        if (widget.experience.descriptionPoints.isNotEmpty)
          ...List.generate(
            widget.experience.descriptionPoints.length,
            (i) => Text(
              "• ${widget.experience.descriptionPoints[i]}",
              textAlign: TextAlign.start,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
          ),
      ],
    );
    // return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       // Company Logo
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(8),
    //         child: Image.asset(
    //           widget.experience.logoPath,
    //           width: 100,
    //           height: 100,
    //           fit: BoxFit.contain,
    //           errorBuilder: (context, error, stackTrace) => Icon(
    //             Icons.business,
    //             size: 100,
    //             color: theme.colorScheme.secondary,
    //           ),
    //         ),
    //       ),
    //       const SizedBox(
    //           width: 16,
    //           height:
    //               16), // Spacing (horizontal on desktop, vertical on mobile)
    //       // Details
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // Top Row: Company Name, Location, Timeline
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       widget.experience.companyName,
    //                       style: theme.textTheme.titleLarge?.copyWith(
    //                           fontSize: 20, fontWeight: FontWeight.bold),
    //                     ),
    //                     Row(
    //                       children: [
    //                         Icon(Icons.location_on,
    //                             size: 16, color: theme.iconTheme.color),
    //                         const SizedBox(width: 4),
    //                         Text(
    //                           widget.experience.location,
    //                           style: theme.textTheme.bodyMedium
    //                               ?.copyWith(fontSize: 14),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Icon(Icons.calendar_today,
    //                         size: 16, color: theme.iconTheme.color),
    //                     const SizedBox(width: 4),
    //                     Text(
    //                       widget.experience.timeline,
    //                       style: theme.textTheme.bodyMedium
    //                           ?.copyWith(fontSize: 14),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 8),
    //             // Description Bullet Points
    //             if (widget.experience.descriptionPoints.isNotEmpty)
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: widget.experience.descriptionPoints
    //                     .map((point) => Padding(
    //                           padding: const EdgeInsets.only(bottom: 4),
    //                           child: Text(
    //                             "• $point",
    //                             style: theme.textTheme.bodyMedium
    //                                 ?.copyWith(fontSize: 16),
    //                           ),
    //                         ))
    //                     .toList(),
    //               ),
    //           ],
    //         ),
    //       ),
    //     ]);
  }
}
