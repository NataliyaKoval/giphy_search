import 'package:flutter/material.dart';
import 'package:giphy_search/consts/app_colors.dart';
import 'package:giphy_search/consts/app_strings.dart';

class EmptyResultContainer extends StatelessWidget {
  const EmptyResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatFound,
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              AppStrings.noSearch,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.argent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
