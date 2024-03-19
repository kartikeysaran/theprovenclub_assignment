import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/logic/bloc/api/giphy_api_cubit.dart';
import 'package:sample/presentation/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sample/presentation/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: BlocProvider(
        create: (context) => GifCubit(),
        child: HomeScreen(),
      )
    );
  }
}