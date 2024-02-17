import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';
import 'package:geoking/features/game/game.dart';
import 'package:geoking/features/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GameBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Geoking',
        theme: ThemeData(
          fontFamily: 'Fredoka',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/game': (context) => const GamePage(),
        },
      ),
    );
  }
}
