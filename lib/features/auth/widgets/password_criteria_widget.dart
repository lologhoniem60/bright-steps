import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/validations/password_criteria_validations.dart';

class PasswordCriteriaWidget extends StatelessWidget {
  const PasswordCriteriaWidget({
    super.key,
    required this.password,
  });

  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCriterion(
          'At least 8 characters',
          PasswordCriteriaValidations.hasMinLength(password),
        ),
        const SizedBox(height: 4),
        _buildCriterion(
          'At least one uppercase letter',
          PasswordCriteriaValidations.hasUppercase(password),
        ),
        const SizedBox(height: 4),
        _buildCriterion(
          'At least one lowercase letter',
          PasswordCriteriaValidations.hasLowercase(password),
        ),
        const SizedBox(height: 4),
        _buildCriterion(
          'At least one number',
          PasswordCriteriaValidations.hasNumber(password),
        ),
        const SizedBox(height: 4),
        _buildCriterion(
          'At least one special character (!@#\$&*~)',
          PasswordCriteriaValidations.hasSpecialCharacter(password),
        ),
      ],
    );
  }

  Widget _buildCriterion(String text, bool met) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
          size: 16,
          color: met ? Colors.green : ColorsManager.muted,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: met ? ColorsManager.ink : ColorsManager.muted,
            fontWeight: met ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
