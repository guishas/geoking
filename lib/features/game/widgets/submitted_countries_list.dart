import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class SubmittedCountriesList extends StatelessWidget {
  const SubmittedCountriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state.submittedCountries.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text(
                'Type a country to start',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          );
        }

        return Expanded(
          child: ListView.separated(
            itemCount: state.submittedCountries.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: state.submittedCountries[index].name!.common == state.secretCountry!.name!.common ? Colors.green.shade300 : state.submittedCountries[index].color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.submittedCountries[index].name!.common!),
                    Text('${state.submittedCountries[index].distance} km'),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
