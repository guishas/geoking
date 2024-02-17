part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GameCountryChanged extends GameEvent {
  const GameCountryChanged({
    required this.country,
  });

  final String country;

  @override
  List<Object> get props => [country];
}
