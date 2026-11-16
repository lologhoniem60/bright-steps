import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import 'curved_panel_clipper.dart';

class OnboardingBottomPanel extends StatelessWidget {
  const OnboardingBottomPanel({
    super.key,
    required this.pageIndex,
    required this.pageCount,
    required this.panelHeight,
    required this.onNext,
  });

  final int pageIndex;
  final int pageCount;
  final double panelHeight;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: panelHeight,
      width: double.infinity,
      child: ClipPath(
        clipper: const CurvedPanelClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE8F5FC), Color(0xFFF3FAFD)],
            ),
            border: Border(
              top: BorderSide(color: Color(0xFFBCCBD0), width: 1.2),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(28, 34, 28, 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pageCount, (index) {
                  final active = index == pageIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 10 : 8,
                    height: active ? 10 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? ColorsManager.navy : ColorsManager.sky,
                    ),
                  );
                }),
              ),
              const Spacer(),
              SizedBox(
                width: 244,
                height: 50,
                child: FilledButton(
                  onPressed: onNext,
                  style: FilledButton.styleFrom(
                    backgroundColor: ColorsManager.navy,
                    shape: const StadiumBorder(),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pageIndex == pageCount - 1 ? 'Get Started' : 'Next',
                      ),
                      if (pageIndex == pageCount - 1) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 17),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
