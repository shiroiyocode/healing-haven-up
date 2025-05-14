import 'package:url_launcher/url_launcher.dart';

Future<void> launchPrivacyPolicy() async {
  final Uri url = Uri.parse('https://deoderm.ph/privacy-policy/');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> launchTermsAndConditions() async {
  final Uri url = Uri.parse('https://deoderm.ph/terms-and-conditions/');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
