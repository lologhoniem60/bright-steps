import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/validations/validations.dart';
import '../../../core/widgets/auth_or_divider.dart';
import '../../../core/widgets/auth_primary_button.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/password_criteria_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _secondNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _passwordFocusNode;

  bool _passwordVisible = false;
  bool _confirmVisible = false;
  bool _isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _secondNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController.addListener(_onPasswordChanged);
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(_onFocusChanged);
    _confirmPasswordController = TextEditingController();
  }

  void _onPasswordChanged() {
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {
      _isPasswordFocused = _passwordFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.removeListener(_onPasswordChanged);
    _passwordController.dispose();
    _passwordFocusNode.removeListener(_onFocusChanged);
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 6),
                const AuthHeaderWidget(
                  title: StringsManager.createYourAccount,
                  subtitle: StringsManager.registerSubtitle,
                ),
                const SizedBox(height: 14),
                AuthTextField(
                  controller: _firstNameController,
                  validator: Validations.validateFirstName,
                  hint: StringsManager.firstNameHint,
                  icon: Icons.person_outline_rounded,
                ),
                const SizedBox(height: 12),
                AuthTextField(
                  controller: _secondNameController,
                  validator: Validations.validateLastName,
                  hint: StringsManager.secondNameHint,
                  icon: Icons.person_outline_rounded,
                ),
                const SizedBox(height: 12),
                AuthTextField(
                  controller: _emailController,
                  validator: Validations.validateEmail,
                  hint: StringsManager.emailHint,
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                AuthTextField(
                  controller: _phoneController,
                  validator: Validations.validatePhone,
                  hint: StringsManager.phoneNumberHint,
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                AuthTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  validator: Validations.validatePassword,
                  hint: StringsManager.passwordHint,
                  icon: Icons.lock_outline_rounded,
                  obscureText: !_passwordVisible,
                  suffix: IconButton(
                    onPressed: () =>
                        setState(() => _passwordVisible = !_passwordVisible),
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    ),
                  ),
                ),
                if (_isPasswordFocused || _passwordController.text.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  PasswordCriteriaWidget(password: _passwordController.text),
                ],
                const SizedBox(height: 12),
                AuthTextField(
                  controller: _confirmPasswordController,
                  validator: (value) => Validations.validatePasswordConfirmation(
                    _passwordController.text,
                    value,
                  ),
                  hint: StringsManager.confirmPasswordHint,
                  icon: Icons.lock_outline_rounded,
                  obscureText: !_confirmVisible,
                  suffix: IconButton(
                    onPressed: () =>
                        setState(() => _confirmVisible = !_confirmVisible),
                    icon: Icon(
                      _confirmVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AuthPrimaryButton(
                  label: StringsManager.signUp,
                  onPressed: _submit,
                  height: 46,
                  arrow: true,
                ),
                const SizedBox(height: 12),
                const AuthOrDivider(),
                const SizedBox(height: 12),
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        StringsManager.alreadyHaveAccount,
                        style: TextStyle(
                          color: ColorsManager.muted,
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, Routes.loginRoute),
                        child: const Text(
                          StringsManager.signIn,
                          style: TextStyle(
                            color: ColorsManager.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
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
