import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_search/consts/app_colors.dart';
import 'package:giphy_search/consts/app_strings.dart';
import 'package:giphy_search/presentation/search_screen/bloc/search_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late FocusNode _textFieldFocusNode;
  late TextEditingController _inputController;
  bool _isFilled = false;
  bool _isSuffixIconVisible = false;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _textFieldFocusNode = FocusNode()..addListener(() => _changeInputFilling());
  }

  void _changeInputFilling() {
    setState(() {
      _isFilled = _textFieldFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _inputController,
      focusNode: _textFieldFocusNode,
      decoration: InputDecoration(
        filled: _isFilled,
        fillColor: AppColors.desertSand,
        contentPadding: const EdgeInsets.all(18),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Icon(Icons.search, color: AppColors.orange),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.orange,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.orange,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 20,
          minWidth: 20,
        ),
        suffixIcon: Visibility(
          visible: _isSuffixIconVisible,
          child: IconButton(
            onPressed: _onClearInput,
            icon: const Icon(
              Icons.close,
              color: AppColors.orange,
            ),
          ),
        ),
        hintText: AppStrings.hintText,
        hintStyle: const TextStyle(color: AppColors.argent),
      ),
      onChanged: (value) => _onInputChanged(context, value),
    );
  }

  void _onInputChanged(BuildContext context, String value) {
    setState(() {
      _isSuffixIconVisible = _inputController.text.isNotEmpty;
    });
    if (value.trim().isNotEmpty) {
      context.read<SearchBloc>().add(SearchGifsEvent(value));
    }
  }

  void _onClearInput() {
    _inputController.clear();
    setState(() {
      _isSuffixIconVisible = false;
    });
  }
}
