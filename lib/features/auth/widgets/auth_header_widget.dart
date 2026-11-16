import 'package:flutter/material.dart';

import '../../../config/theme/font_manager.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x24193B79),
                blurRadius: 14,
                spreadRadius: 1,
                offset: Offset(0, 6),
              ),
              BoxShadow(
                color: Color(0x10000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            AssetsManager.authLogo,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              fontFamily: FontConstants.fontFamily,
              height: 1.05,
            ),
            children: [
              TextSpan(
                text: 'Bright ',
                style: TextStyle(color: ColorsManager.navy),
              ),
              TextSpan(
                text: 'Steps',
                style: TextStyle(color: ColorsManager.cyan),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          StringsManager.appTagline,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.sky,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorsManager.navy,
            fontSize: 23,
            height: 1.1,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorsManager.blue,
            fontSize: 14,
            height: 1.15,
          ),
        ),
      ],
    );
  }
}
