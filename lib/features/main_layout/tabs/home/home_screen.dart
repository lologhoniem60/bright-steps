import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Banner with Logo, Bell, Avatar, Welcome & Quote
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE8F4FC),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.appLogo, height: 32),
                      Stack(
                        children: [
                          const Icon(
                            Icons.notifications_none_rounded,
                            color: ColorsManager.blue,
                            size: 26,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF5252),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AssetsManager.avatar3, height: 78),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.welcome,
                              style: TextStyle(
                                color: ColorsManager.navy,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                height: 1.1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              StringsManager.welcomeQuote,
                              style: TextStyle(
                                color: ColorsManager.sky,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: StringsManager.search,
                      prefixIcon: const Icon(Icons.search, color: ColorsManager.muted),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: ColorsManager.sky, width: 1.2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: ColorsManager.blue, width: 1.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2x2 Grid of Feature Cards
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.15,
                    children: [
                      _buildCategoryCard(
                        title: StringsManager.childProfile,
                        subtitle: StringsManager.trackCondition,
                        image: AssetsManager.avatar3,
                        bgColor: const Color(0xFFE5F3FC),
                        textColor: ColorsManager.navy,
                        subTextColor: ColorsManager.sky,
                        onTap: () => Navigator.pushNamed(context, Routes.kidsProfileRoute),
                      ),
                      _buildCategoryCard(
                        title: StringsManager.doctors,
                        subtitle: StringsManager.chooseDoctor,
                        image: AssetsManager.doctors,
                        bgColor: const Color(0xFFFDE8EC),
                        textColor: ColorsManager.navy,
                        subTextColor: ColorsManager.sky,
                        onTap: () {},
                      ),
                      _buildCategoryCard(
                        title: StringsManager.games,
                        subtitle: StringsManager.interactiveGames,
                        image: AssetsManager.games,
                        bgColor: const Color(0xFFFFF9E6),
                        textColor: ColorsManager.navy,
                        subTextColor: ColorsManager.sky,
                        onTap: () {},
                      ),
                      _buildCategoryCard(
                        title: StringsManager.childAssessment,
                        subtitle: StringsManager.assessSkills,
                        image: AssetsManager.childAssessment,
                        bgColor: const Color(0xFFE8F6F2),
                        textColor: ColorsManager.navy,
                        subTextColor: ColorsManager.sky,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Banner Card
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFECEFFC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(AssetsManager.everyWord, height: 85),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            StringsManager.everyWordBanner,
                            style: TextStyle(
                              color: ColorsManager.navy,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              height: 1.25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Quick Action Icons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAction(Icons.info_outline_rounded, StringsManager.aboutUs),
                      _buildQuickAction(Icons.star_rounded, StringsManager.favorites),
                      _buildQuickAction(Icons.newspaper_rounded, StringsManager.usefulArticles),
                      _buildQuickAction(Icons.headset_mic_rounded, StringsManager.contactUs),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required String image,
    required Color bgColor,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: subTextColor,
                fontSize: 9.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsManager.paleBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: ColorsManager.blue, size: 22),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: ColorsManager.navy,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
