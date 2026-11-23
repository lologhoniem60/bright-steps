import 'package:flutter/material.dart';

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
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            AssetsManager.appLogo,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          StringsManager.appTagline,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.sky,
            fontSize: 18,
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
            fontSize: 18,
            height: 1.15,
          ),
        ),
      ],
    );
  }
}
