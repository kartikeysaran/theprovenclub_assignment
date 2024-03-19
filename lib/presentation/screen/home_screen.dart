import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/logic/bloc/api/giphy_api_cubit.dart';
import 'package:sample/presentation/components/gif_view.dart';
import 'package:sample/presentation/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GifCubit gifCubit = BlocProvider.of<GifCubit>(context);
    gifCubit.fetchTrendingGifs(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('The Proven Club Assignment'),
        actions: [_buildThemeToggle(context)],
      ),
      body: Column(
        children: [
          SearchBar(cubit: gifCubit),
          Expanded(child: GifView())
        ]),
    );
  }
}

Widget _buildThemeToggle(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  return IconButton(onPressed: (){themeProvider.toggleTheme();}, icon: Icon(themeProvider.currentTheme == ThemeData.light()
    ? Icons.dark_mode
    : Icons.lightbulb_outline
  ));

}

