import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
          const GameInitial(
            country: '',
          ),
        ) {
    on<GameCountryChanged>(onCountryChanged);
  }

  void onCountryChanged(GameCountryChanged event, Emitter<GameState> emit) {
    emit(state.copyWith(country: event.country));
  }
}
