import '../core/resources/assets_manager.dart';
import '../core/resources/strings_manager.dart';

class OnboardingModel {
  const OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  static const List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AssetsManager.onboardingSupport,
      title: StringsManager.onboardingTitle1,
      subtitle: StringsManager.onboardingSubtitle1,
    ),
    OnboardingModel(
      image: AssetsManager.onboardingSpeech,
      title: StringsManager.onboardingTitle2,
      subtitle: StringsManager.onboardingSubtitle2,
    ),
    OnboardingModel(
      image: AssetsManager.onboardingPotential,
      title: StringsManager.onboardingTitle3,
      subtitle: StringsManager.onboardingSubtitle3,
    ),
  ];
}
