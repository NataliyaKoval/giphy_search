import 'package:flutter/material.dart';
import 'package:giphy_search/consts/app_colors.dart';
import 'package:giphy_search/consts/app_strings.dart';
import 'package:giphy_search/domain/models/gif.dart';
import 'package:giphy_search/presentation/search_screen/widgets/search_results_list.dart';

class SearchLoadedContainer extends StatelessWidget {
  const SearchLoadedContainer({
    super.key,
    required this.gifs,
    required this.onFinishingScroll,
  });

  final List<Gif> gifs;
  final VoidCallback onFinishingScroll;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.whatHaveFound,
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SearchResultList(
            gifs: gifs,
            onFinishingScroll: onFinishingScroll,
          ),
        ),
      ],
    );
  }
}
