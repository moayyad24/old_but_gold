import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static Future<void> openWhatsApp({
    required String phone,
    String message = '',
  }) async {
    // try native scheme first
    final Uri whatsappUrl = Uri.parse(
      "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      // fallback to https if the native scheme is not available (e.g. iOS web open)
      final Uri fallbackUrl = Uri.parse(
        "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
      );

      if (await canLaunchUrl(fallbackUrl)) {
        await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch WhatsApp');
      }
    }
  }
}
