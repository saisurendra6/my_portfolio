import 'package:my_portfolio/models/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void launchResume() async {
    final url = Uri.parse(PortfolioData().resumeLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Handle error (show a snackbar, etc.)
    }
  }
}
