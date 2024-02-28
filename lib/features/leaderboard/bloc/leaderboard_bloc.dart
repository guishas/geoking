import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geoking/features/leaderboard/models/score.dart';
import 'package:geoking/firebase/database_repository.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc({required this.databaseRepository}) : super(const LeaderboardState()) {
    on<LeaderboardSubscriptionRequested>(onSubscriptionRequested);
  }

  final DatabaseRepository databaseRepository;

  Future<void> onSubscriptionRequested(LeaderboardSubscriptionRequested event, Emitter<LeaderboardState> emit) async {
    emit(state.copyWith(status: LeaderboardStatus.loading));

    try {
      final scores = await databaseRepository.fetchScores();

      scores.sort((a, b) => a.score!.compareTo(b.score!));

      emit(state.copyWith(
        status: LeaderboardStatus.success,
        scores: scores,
      ));
    } catch (e) {
      emit(state.copyWith(status: LeaderboardStatus.failure));
    }
  }
}
