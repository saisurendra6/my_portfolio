import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/portfolio_data.dart';
import '../providers/theme_provider.dart';
import '../utils/utils.dart';
import '../widgets/custom_button.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final List<GlobalKey> sectionKeys;
  final ScrollController scrollController;

  const NavBar({
    super.key,
    required this.sectionKeys,
    required this.scrollController,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isOpaque = false;
  int? _hoveredIndex;
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        if (_currentSection != _getCurrentSection()) {
          _currentSection = _getCurrentSection();
        }
        _isOpaque = widget.scrollController.offset > 0;
      });
    });
  }

  int _getCurrentSection() {
    for (int i = 0; i < widget.sectionKeys.length; i++) {
      final key = widget.sectionKeys[i];
      final ctx = key.currentContext;
      if (ctx != null) {
        // Get the box of this section relative to the scrollable area
        final box = ctx.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero,
            ancestor: context.findRenderObject());
        double top = offset.dy;
        double height = box.size.height;

        // The AppBar height is kToolbarHeight
        if (top - kToolbarHeight <= 0 && top + height - kToolbarHeight > 0) {
          return i;
        }
      }
    }
    return _currentSection;
  }

  void _scrollToSection(int index) {
    // log(_currPos.toString());
    setState(() {
      _currentSection = index;
      _hoveredIndex = null; // Reset hovered index on click
    });
    Scrollable.ensureVisible(
      widget.sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchURL(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch URL')),
      );
    }
  }

  void _openMobileDrawer() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        final theme = Theme.of(context);
        return Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width *
                0.8, // 80% width for right-side drawer
            child: Material(
              color: theme.scaffoldBackgroundColor,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    leading:
                        Icon(Icons.person, color: theme.colorScheme.secondary),
                    title: Text('About', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(0);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timeline,
                        color: theme.colorScheme.secondary),
                    title:
                        Text('Experience', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(5);
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.work, color: theme.colorScheme.secondary),
                    title: Text('Projects', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(1);
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.star, color: theme.colorScheme.secondary),
                    title: Text('Skills', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(2);
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.school, color: theme.colorScheme.secondary),
                    title:
                        Text('Education', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(3);
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.badge, color: theme.colorScheme.secondary),
                    title: Text('Certifications',
                        style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(4);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail,
                        color: theme.colorScheme.secondary),
                    title: Text('Contact', style: theme.textTheme.labelMedium),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(6);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.brightness_6,
                        color: theme.colorScheme.secondary),
                    title: Text('Toggle Theme',
                        style: theme.textTheme.labelMedium),
                    onTap: () {
                      ThemeProvider.toggleTheme();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.download,
                        color: theme.colorScheme.secondary),
                    title: Text('Download Resume',
                        style: theme.textTheme.labelMedium),
                    onTap: () {
                      // TODO: Implement resume download
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.linkedin,
                        color: AppColors.secondary),
                    title: Text('LinkedIn', style: theme.textTheme.labelMedium),
                    onTap: () {
                      _launchURL(portfolioData.linkedinLink);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.github,
                        color: AppColors.secondary),
                    title: Text('GitHub', style: theme.textTheme.labelMedium),
                    onTap: () {
                      _launchURL(portfolioData.githubLink);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.code,
                        color: AppColors.secondary),
                    title: Text('LeetCode', style: theme.textTheme.labelMedium),
                    onTap: () {
                      _launchURL(portfolioData.leetcodeLink);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                  .animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AppBar(
      backgroundColor:
          theme.scaffoldBackgroundColor.withOpacity(_isOpaque ? 1.0 : 0.8),
      elevation: _isOpaque ? 4 : 0,
      title: Text(
        portfolioData.name,
        style: theme.textTheme.headlineMedium?.copyWith(
          color: theme.textTheme.headlineMedium?.color,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: isMobile
          ? [
              IconButton(
                  icon: const Icon(Icons.menu), onPressed: _openMobileDrawer)
            ]
          : [
              // Desktop actions (as in your original code)
              ...[
                'About',
                'Experience',
                'My Projects',
                'My Skills',
                'Education',
                'Certifications',
                'Contact Me'
              ].asMap().entries.map((e) => InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onHover: (hovering) {
                      setState(() {
                        _hoveredIndex = hovering ? e.key : null;
                      });
                    },
                    onTap: () => _scrollToSection(e.key),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color:
                            _hoveredIndex == e.key || _currentSection == e.key
                                ? theme.colorScheme.secondary.withOpacity(0.1)
                                : Colors.transparent,
                      ),
                      child: Text(
                        e.value,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: _currentSection == e.key
                              ? theme.colorScheme.secondary
                              : theme.textTheme.labelMedium?.color,
                        ),
                      ),
                    ),
                  )),
              // TextButton(
              //       onPressed: () => _scrollToSection(e.key),
              //       child: Text(e.value,
              //           style: theme.textTheme.labelMedium?.copyWith(
              //             color: _hoveredIndex == e.key
              //                 ? theme.colorScheme.secondary
              //                 : theme.textTheme.labelMedium?.color,
              //           )),
              //     )),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => _launchURL(portfolioData.linkedinLink),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => _launchURL(portfolioData.githubLink),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.code),
                onPressed: () => _launchURL(portfolioData.leetcodeLink),
              ),
              IconButton(
                icon: Icon(
                    ThemeProvider.currentTheme.brightness == Brightness.light
                        ? Icons.wb_sunny
                        : Icons.nightlight_round),
                onPressed: ThemeProvider.toggleTheme,
              ),
              CustomButton(
                text: 'View Resume',
                color: AppColors.accentHighlight,
                onPressed: Utils.launchResume,
                icon: Icons.download,
              ),
            ],
    );
  }
}
