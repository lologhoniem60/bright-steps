import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/validations/validations.dart';
import '../../../core/widgets/custom_primary_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendCode() {
    if (_formKey.currentState?.validate() == true) {
      Navigator.pushNamed(context, Routes.otpRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: ColorsManager.ink),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    Image.asset(AssetsManager.appLogo, height: 44),
                    const SizedBox(width: 44),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  StringsManager.forgotPasswordTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.navy,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  AssetsManager.forgetPassword,
                  height: 190,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                const Text(
                  StringsManager.forgotPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.sky,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _emailController,
                  validator: Validations.validateEmail,
                  hint: StringsManager.emailHint,
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 28),
                CustomPrimaryButton(
                  label: StringsManager.sendCode,
                  onPressed: _sendCode,
                  arrow: true,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, Routes.loginRoute),
                  child: const Text(
                    StringsManager.backToSignIn,
                    style: TextStyle(
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
