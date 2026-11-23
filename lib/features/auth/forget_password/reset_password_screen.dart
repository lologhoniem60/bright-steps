import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/validations/validations.dart';
import '../../../core/widgets/custom_primary_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _savePassword() {
    if (_formKey.currentState?.validate() == true) {
      Navigator.pushNamed(context, Routes.passwordSuccessRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  AssetsManager.createNewPassword,
                  height: 160,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 28),
                const Text(
                  StringsManager.createNewPasswordTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.navy,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  StringsManager.createNewPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsManager.sky,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 28),
                CustomTextField(
                  controller: _passwordController,
                  validator: Validations.validatePassword,
                  hint: StringsManager.newPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  obscureText: _obscureNew,
                  suffix: IconButton(
                    onPressed: () => setState(() => _obscureNew = !_obscureNew),
                    icon: Icon(
                      _obscureNew
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: _confirmPasswordController,
                  validator: (val) => Validations.validatePasswordConfirmation(
                    _passwordController.text,
                    val,
                  ),
                  hint: StringsManager.confirmPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  obscureText: _obscureConfirm,
                  suffix: IconButton(
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                    icon: Icon(
                      _obscureConfirm
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomPrimaryButton(
                  label: StringsManager.savePassword,
                  onPressed: _savePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
