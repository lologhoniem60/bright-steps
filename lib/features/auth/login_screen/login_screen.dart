import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/validations/validations.dart';
import '../../../core/widgets/auth_or_divider.dart';
import '../../../core/widgets/auth_primary_button.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../widgets/auth_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _remember = true;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() == true) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const AuthHeaderWidget(
                  title: StringsManager.welcomeBack,
                  subtitle: StringsManager.loginSubtitle,
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  controller: _emailController,
                  validator: Validations.validateEmail,
                  hint: StringsManager.emailHint,
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  controller: _passwordController,
                  validator: Validations.validatePassword,
                  hint: StringsManager.passwordHint,
                  icon: Icons.lock_outline_rounded,
                  obscureText: _obscure,
                  suffix: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 30,
                      child: Checkbox(
                        value: _remember,
                        activeColor: ColorsManager.blue,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) =>
                            setState(() => _remember = value ?? false),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(StringsManager.rememberMe, style: TextStyle(fontSize: 12)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        StringsManager.forgotPassword,
                        style: TextStyle(color: ColorsManager.blue, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                AuthPrimaryButton(label: StringsManager.signIn, onPressed: _submit),
                const SizedBox(height: 10),
                const AuthOrDivider(),
                const SizedBox(height: 10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      StringsManager.dontHaveAccount,
                      style: TextStyle(color: ColorsManager.muted, fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, Routes.registerRoute),
                      child: const Text(
                        StringsManager.signUp,
                        style: TextStyle(
                          color: ColorsManager.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
