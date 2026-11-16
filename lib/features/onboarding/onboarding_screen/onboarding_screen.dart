import 'package:flutter/material.dart';

import '../../../core/prefs_manager/prefs_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../models/onboarding_model.dart';
import '../widgets/onboarding_bottom_panel.dart';
import '../widgets/onboarding_content_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _slides = OnboardingModel.onboardingList;

  Future<void> _finish() async {
    await PrefsManager.setOnboardingSeen(true);
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final panelHeight = (height * .285).clamp(205.0, 260.0);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: ColorsManager.blue, fontSize: 14),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContentWidget(
                  data: _slides[index],
                ),
              ),
            ),
            OnboardingBottomPanel(
              pageIndex: _currentIndex,
              pageCount: _slides.length,
              panelHeight: panelHeight,
              onNext: _currentIndex == _slides.length - 1
                  ? _finish
                  : () => _controller.nextPage(
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOut,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
