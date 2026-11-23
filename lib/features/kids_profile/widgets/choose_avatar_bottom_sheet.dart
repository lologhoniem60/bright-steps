import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';

class ChooseAvatarBottomSheet extends StatefulWidget {
  const ChooseAvatarBottomSheet({
    super.key,
    required this.selectedAvatar,
    required this.onAvatarSelected,
    required this.onContinue,
  });

  final String selectedAvatar;
  final ValueChanged<String> onAvatarSelected;
  final VoidCallback onContinue;

  @override
  State<ChooseAvatarBottomSheet> createState() => _ChooseAvatarBottomSheetState();
}

class _ChooseAvatarBottomSheetState extends State<ChooseAvatarBottomSheet> {
  late String _currentSelected;

  static const List<String> _avatars = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
  ];

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.selectedAvatar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE6F3FB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              color: ColorsManager.muted.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(child: Divider(color: ColorsManager.sky, thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  StringsManager.chooseAccountPicture,
                  style: const TextStyle(
                    color: ColorsManager.navy,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: ColorsManager.sky, thickness: 1)),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final avatar = _avatars[index];
              final isSelected = avatar == _currentSelected;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSelected = avatar;
                  });
                  widget.onAvatarSelected(avatar);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: ColorsManager.blue, width: 3)
                            : null,
                      ),
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                    if (isSelected)
                      const Positioned(
                        top: 2,
                        right: 2,
                        child: Icon(
                          Icons.check_rounded,
                          color: ColorsManager.ink,
                          size: 20,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onContinue();
              },
              style: FilledButton.styleFrom(
                backgroundColor: ColorsManager.navy,
                shape: const StadiumBorder(),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.continueText,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
