import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class supportViewBody extends StatelessWidget {
  const supportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stackItemSupport(
                onTap: () => _launchWhatsApp(
                    phoneNumber: '218915511445', context: context),
                textSupport: ' الدعم الفني',
                iconSupport: FontAwesomeIcons.whatsapp,
              ),
              stackItemSupport(
                onTap: () =>
                    _launchURL(url: 'https://rhalla.online/', context: context),
                textSupport: 'موقعنا الالكتروني',
                iconSupport: FontAwesomeIcons.globe,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(
      {required String url, required BuildContext context}) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'فشل في فتح الرابط', Colors.red);
    }
  }

  Future<void> _launchWhatsApp(
      {required String phoneNumber, required BuildContext context}) async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'فشل في فتح الرابط', Colors.red);
    }
  }
}
