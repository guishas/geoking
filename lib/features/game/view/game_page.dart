import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/common/colors.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';
import 'package:geoking/features/game/repository/game_repository.dart';
import 'package:geoking/features/game/widgets/attempts_counter.dart';
import 'package:geoking/features/game/widgets/country_message.dart';
import 'package:geoking/features/game/widgets/country_textfield.dart';
import 'package:geoking/features/game/widgets/submit_highscore.dart';
import 'package:geoking/features/game/widgets/submitted_countries_list.dart';
import 'package:geoking/features/game/widgets/util_buttons.dart';
import 'package:geoking/firebase/database_repository.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc(
        gameRepository: GameRepository(),
        databaseRepository: context.read<DatabaseRepository>(),
      )..add(const GameSubscriptionRequested()),
      child: const GameView(),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainOceanBlue,
              AppColors.mainLightGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: BlocConsumer<GameBloc, GameState>(
            listener: (context, state) {
              if (state.status == GameStateStatus.finished) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state.status == GameStateStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black54,
                  ),
                );
              } else if (state.status == GameStateStatus.failure) {
                return const Center(
                  child: Text(
                    'Unable to fetch countries :(',
                  ),
                );
              }

              return const Column(
                children: [
                  UtilButtons(),
                  SizedBox(
                    height: 8,
                  ),
                  CountryTextField(),
                  SizedBox(
                    height: 4,
                  ),
                  AttemptsCounter(),
                  SizedBox(
                    height: 8,
                  ),
                  CountryMessage(),
                  SubmitHighscore(),
                  SizedBox(
                    height: 8,
                  ),
                  SubmittedCountriesList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
