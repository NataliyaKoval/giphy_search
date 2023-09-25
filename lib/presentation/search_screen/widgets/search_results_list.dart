import 'package:flutter/material.dart';
import 'package:giphy_search/domain/models/gif.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    Key? key,
    required this.gifs,
  }) : super(key: key);

  final List<Gif> gifs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: gifs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1 / 1.2,
      ),
      itemBuilder: (context, index) => Image.network(gifs[index].images.downsized.url, fit: BoxFit.cover),
    );
  }
}
