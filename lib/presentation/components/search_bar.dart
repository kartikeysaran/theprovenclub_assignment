import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../logic/bloc/api/giphy_api_cubit.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final GifCubit cubit;

  SearchBar({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search for Gifs',
          suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {
              cubit.searchGifs(_controller.text, 0);
          },)
        ),
        onSubmitted: (value) {
          cubit.searchGifs(_controller.text, 0);
        },
      ),
    );
  }
}