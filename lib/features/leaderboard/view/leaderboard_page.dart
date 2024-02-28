import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/common/colors.dart';
import 'package:geoking/features/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:geoking/firebase/database_repository.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LeaderboardBloc(
        databaseRepository: context.read<DatabaseRepository>(),
      )..add(const LeaderboardSubscriptionRequested()),
      child: const LeaderboardView(),
    );
  }
}

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'LEADERBOARD',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
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
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
                  builder: (context, state) {
                    if (state.status == LeaderboardStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black54,
                        ),
                      );
                    } else if (state.status == LeaderboardStatus.failure) {
                      return const Center(
                        child: Text(
                          'Unable to fetch leaderboard :(',
                        ),
                      );
                    } else if (state.status == LeaderboardStatus.success && state.scores.isEmpty) {
                      return const Center(
                        child: Text(
                          'The leaderboards are empty! Play a game to join the leaderboards!',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 35,
                              child: Text(
                                'Pos',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'Country',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text(
                                'Attempts',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.scores.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    child: Text(
                                      '${index + 1}.',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: Text(
                                      state.scores[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.scores[index].country.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      state.scores[index].score.toString(),
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
