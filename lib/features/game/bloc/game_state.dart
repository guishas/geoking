part of 'game_bloc.dart';

final class GameState extends Equatable {
  const GameState({
    required this.country,
  });

  final String? country;

  GameState copyWith({
    String? country,
  }) {
    return GameState(
      country: country ?? this.country,
    );
  }

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {
  const GameInitial({required super.country});
}
