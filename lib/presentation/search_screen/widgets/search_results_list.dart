import 'package:flutter/material.dart';
import 'package:giphy_search/consts/app_colors.dart';
import 'package:giphy_search/domain/models/gif.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({
    Key? key,
    required this.gifs,
    required this.onFinishingScroll,
  }) : super(key: key);

  final List<Gif> gifs;
  final VoidCallback onFinishingScroll;

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //TODO
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 300) {
        widget.onFinishingScroll();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.gifs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.2,
      ),
      itemBuilder: (context, index) => Image.network(
        widget.gifs[index].images.previewGif.url,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppColors.tumbleweed,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
