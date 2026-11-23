import 'package:flutter/material.dart';

import '../../features/auth/forget_password/forgot_password_screen.dart';
import '../../features/auth/forget_password/otp_verification_screen.dart';
import '../../features/auth/forget_password/password_reset_success_screen.dart';
import '../../features/auth/forget_password/reset_password_screen.dart';
import '../../features/auth/login_screen/login_screen.dart';
import '../../features/auth/register_screen/register_screen.dart';
import '../../features/kids_profile/kids_profile_screen/kids_profile_screen.dart';
import '../../features/main_layout/main_layout_screen.dart';
import '../../features/main_layout/tabs/faq/faq_screen.dart';
import '../../features/main_layout/tabs/more/more_screen.dart';
import '../../features/main_layout/tabs/tips/tips_screen.dart';
import '../../features/onboarding/onboarding_screen/onboarding_screen.dart';
import '../../features/splash/splash_screen/splash_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String kidsProfileRoute = "/kids-profile";
  static const String homeRoute = "/home";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String otpRoute = "/otp";
  static const String resetPasswordRoute = "/reset-password";
  static const String passwordSuccessRoute = "/password-success";
  static const String tipsRoute = "/tips";
  static const String faqRoute = "/faq";
  static const String moreRoute = "/more";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.kidsProfileRoute:
        return MaterialPageRoute(builder: (_) => const KidsProfileScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.passwordSuccessRoute:
        return MaterialPageRoute(builder: (_) => const PasswordResetSuccessScreen());
      case Routes.tipsRoute:
        return MaterialPageRoute(builder: (_) => const TipsScreen());
      case Routes.faqRoute:
        return MaterialPageRoute(builder: (_) => const FaqScreen());
      case Routes.moreRoute:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.noRouteFound),
        ),
        body: const Center(child: Text(StringsManager.noRouteFound)),
      ),
    );
  }
}
