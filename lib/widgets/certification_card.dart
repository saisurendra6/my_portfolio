import 'package:flutter/material.dart';
import 'package:my_portfolio/models/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationCard extends StatefulWidget {
  final Certification certification;
  const CertificationCard({super.key, required this.certification});

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool _isHovered = false;

  Future<void> _viewCredential() async {
    final url = Uri.parse(widget.certification.link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open credential')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.02 : 1.0), // Subtle scale on hover
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Awesome gradient background
            colors: [
              Theme.of(context).cardColor,
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                : Theme.of(context).dividerColor.withOpacity(0.4),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(
                  _isHovered ? 0.1 : 0.05), // Enhanced shadow on hover
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- Top Section ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon with a colored background
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      Icons.military_tech_outlined,
                      color: _isHovered
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8)
                          : Theme.of(context)
                              .colorScheme
                              .secondary, // Color transition on hover
                      size: 28.0,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Text content (Title, Subtitle, Date)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.certification.title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                  ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.certification.issuer,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 16.0,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              widget.certification.date,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 13.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- Divider ---
            Divider(
              height: 1,
              thickness: 1,
              color: _isHovered
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                  : Theme.of(context).dividerColor.withOpacity(0.4),
            ),

            // --- Bottom Section ---
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed:
                      _viewCredential, // Added functionality to launch URL
                  icon: Icon(Icons.open_in_new,
                      size: 20.0,
                      color: Theme.of(context).colorScheme.secondary),
                  label: Text(
                    'View Credential',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  // style: OutlinedButton.styleFrom(
                  //   backgroundColor: Colors.white,
                  //   side: BorderSide(
                  //       color: _isHovered
                  //           ? Theme.of(context).colorScheme.secondary
                  //           : Theme.of(context).dividerColor),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16.0),
                  //   ),
                  //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
