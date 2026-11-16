import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';

class AuthOrDivider extends StatelessWidget {
  const AuthOrDivider({super.key});

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Expanded(child: Divider(color: ColorsManager.muted, thickness: .7)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Text(StringsManager.or, style: TextStyle(fontSize: 13, color: ColorsManager.ink)),
      ),
      Expanded(child: Divider(color: ColorsManager.muted, thickness: .7)),
    ],
  );
}
