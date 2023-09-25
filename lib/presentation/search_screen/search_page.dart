import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_search/domain/repository/repository.dart';
import 'package:giphy_search/domain/use_cases/get_gifs_use_case.dart';
import 'package:giphy_search/presentation/search_screen/bloc/search_bloc.dart';
import 'package:giphy_search/presentation/search_screen/widgets/empty_result_container.dart';
import 'package:giphy_search/presentation/search_screen/widgets/search_loaded_container.dart';
import 'package:giphy_search/presentation/search_screen/widgets/search_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        getGifsUseCase: GetGifsUseCase(
          repository: context.read<Repository>(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) => _buildScreenBody(context, state),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenBody(BuildContext context, SearchState state) {
    if (state is SearchEmpty) {
      return const EmptyResultContainer();
    } else if (state is SearchLoaded) {
      return SearchLoadedContainer(gifs: state.gifs);
    } else if (state is SearchLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container();
    }
  }
}
