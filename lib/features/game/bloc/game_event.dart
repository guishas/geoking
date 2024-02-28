part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GameSubscriptionRequested extends GameEvent {
  const GameSubscriptionRequested();
}

final class GameCountrySubmitted extends GameEvent {
  const GameCountrySubmitted({
    required this.country,
  });

  final String country;

  @override
  List<Object> get props => [country];
}

final class GameNameSubmitted extends GameEvent {
  const GameNameSubmitted({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}
