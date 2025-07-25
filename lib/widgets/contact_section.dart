import 'package:flutter/material.dart';
import 'package:my_portfolio/models/portfolio_data.dart';
import '../constants/colors.dart'; // Make sure AppColors.secondary is your red!

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ContactSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    const accentColor = AppColors.secondary;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        key: sectionKey,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "I'm always open to discussing new projects, creative ideas, or opportunities.\nFeel free to reach out!",
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Center(
            child: Container(
              width: isMobile ? double.infinity : 550,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.05),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(
                  color: accentColor.withOpacity(0.8),
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Here are a few ways to reach me directly.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  _contactRow(
                    icon: Icons.email,
                    label: "Email",
                    value: portfolioData.email,
                    color: accentColor,
                  ),
                  const SizedBox(height: 10),
                  _contactRow(
                    icon: Icons.phone,
                    label: "Phone",
                    value: portfolioData.phone,
                    color: accentColor,
                  ),
                  const SizedBox(height: 10),
                  _contactRow(
                    icon: Icons.location_on,
                    label: "Location",
                    value: portfolioData.location,
                    color: accentColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _contactRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ],
    );
  }
}
