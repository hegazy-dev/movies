import 'package:flutter/material.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';

class LanguageSelector extends StatefulWidget {
  String firstLanguage;
  String secondLanguage;

  LanguageSelector({required this.firstLanguage, required this.secondLanguage});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  int selectedLanguage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          _LanguageButton(
            language: widget.firstLanguage,
            isSelected: selectedLanguage == 0,
            onPressed: () {
              setState(() {
                selectedLanguage = 0;
              });
            },
          ),

          SizedBox(width: 8),

          _LanguageButton(
            language: widget.secondLanguage,
            isSelected: selectedLanguage == 1,
            onPressed: () {
              setState(() {
                selectedLanguage = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  String language;
  bool isSelected;
  VoidCallback onPressed;

  _LanguageButton({
    required this.language,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(language, style: AppTextStyles.textTheme.titleLarge),
      ),
    );
  }
}
