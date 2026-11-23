import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        title: const Text(
          StringsManager.faq,
          style: TextStyle(
            color: ColorsManager.navy,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          StringsManager.faq,
          style: TextStyle(
            color: ColorsManager.blue,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
