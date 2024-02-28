part of 'leaderboard_bloc.dart';

enum LeaderboardStatus {
  initial,
  loading,
  success,
  failure,
}

class LeaderboardState extends Equatable {
  const LeaderboardState({
    this.status = LeaderboardStatus.initial,
    this.scores = const [],
  });

  final LeaderboardStatus status;
  final List<Score> scores;

  LeaderboardState copyWith({
    LeaderboardStatus? status,
    List<Score>? scores,
  }) {
    return LeaderboardState(
      status: status ?? this.status,
      scores: scores ?? this.scores,
    );
  }

  @override
  List<Object> get props => [status, scores];
}
