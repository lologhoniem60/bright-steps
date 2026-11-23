import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../widgets/choose_avatar_bottom_sheet.dart';

class KidsProfileScreen extends StatefulWidget {
  const KidsProfileScreen({super.key});

  @override
  State<KidsProfileScreen> createState() => _KidsProfileScreenState();
}

class _KidsProfileScreenState extends State<KidsProfileScreen> {
  late final TextEditingController _fullNameController;
  DateTime? _selectedDateOfBirth;
  String _selectedGender = StringsManager.male;
  String _selectedAvatar = AssetsManager.avatar3;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  void _openAvatarBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChooseAvatarBottomSheet(
        selectedAvatar: _selectedAvatar,
        onAvatarSelected: (avatar) {
          setState(() {
            _selectedAvatar = avatar;
          });
        },
        onContinue: () {
          // Keep current selection
        },
      ),
    );
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 5),
      firstDate: DateTime(now.year - 18),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDateOfBirth = picked;
      });
    }
  }

  void _continue() {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    final dobFormatted = _selectedDateOfBirth == null
        ? ''
        : '${_selectedDateOfBirth!.day}/${_selectedDateOfBirth!.month}/${_selectedDateOfBirth!.year}';

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsManager.blue),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          StringsManager.kidsProfile,
          style: TextStyle(
            color: ColorsManager.navy,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: _openAvatarBottomSheet,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: ColorsManager.paleBlue,
                      backgroundImage: AssetImage(_selectedAvatar),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorsManager.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Full Name Row / Input
              _buildFieldCard(
                icon: Icons.person_rounded,
                iconColor: const Color(0xFF9E5DF2),
                label: StringsManager.fullName,
                child: TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    color: ColorsManager.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Date of Birth Row / Input
              _buildFieldCard(
                icon: Icons.calendar_month_rounded,
                iconColor: const Color(0xFFFF6B6B),
                label: StringsManager.dateOfBirth,
                trailingIcon: Icons.calendar_today_rounded,
                onTap: _pickDateOfBirth,
                child: Text(
                  dobFormatted.isEmpty ? 'Select Date' : dobFormatted,
                  style: TextStyle(
                    color: dobFormatted.isEmpty
                        ? ColorsManager.muted
                        : ColorsManager.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Gender Row / Input
              _buildFieldCard(
                icon: Icons.male_rounded,
                iconColor: ColorsManager.blue,
                label: StringsManager.gender,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedGender,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    items: [StringsManager.male, StringsManager.female]
                        .map(
                          (g) => DropdownMenuItem(
                            value: g,
                            child: Text(
                              g,
                              style: const TextStyle(
                                color: ColorsManager.ink,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _selectedGender = val;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 36),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: _continue,
                  style: FilledButton.styleFrom(
                    backgroundColor: ColorsManager.navy,
                    shape: const StadiumBorder(),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.continueText,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 18),
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

  Widget _buildFieldCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required Widget child,
    IconData? trailingIcon,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: ColorsManager.paleBlue.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.border.withValues(alpha: 0.4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: ColorsManager.ink,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: child,
            ),
          ),
          if (trailingIcon != null)
            IconButton(
              icon: Icon(trailingIcon, color: const Color(0xFFFF6B6B), size: 20),
              onPressed: onTap,
            ),
        ],
      ),
    );
  }
}
