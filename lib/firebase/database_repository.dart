import 'package:firebase_database/firebase_database.dart';
import 'package:geoking/features/leaderboard/models/score.dart';

class DatabaseRepository {
  final FirebaseDatabase instance = FirebaseDatabase.instance;

  Future<void> addScore(String name, String country, int score) async {
    final DatabaseReference scoresRef = instance.ref('scores');

    final scores = await fetchScores();

    scores.add(Score(name: name, country: country, score: score));
    scores.sort((a, b) => a.score!.compareTo(b.score!));

    // Need a better way to do this, for now it works

    await scoresRef.remove();

    if (scores.length > 20) {
      for (Score s in scores.sublist(0, 20)) {
        await scoresRef.push().set(s.toJson());
      }
    } else {
      for (Score s in scores) {
        await scoresRef.push().set(s.toJson());
      }
    }
  }

  Future<List<Score>> fetchScores() async {
    final DatabaseReference scoresRef = instance.ref('scores');

    final data = await scoresRef.once();

    return data.snapshot.children.map((s) => Score.fromJson(Map<String, dynamic>.from(s.value as Map))).toList();
  }

  Future<bool> isHighscore(int score) async {
    final DatabaseReference scoresRef = instance.ref('scores');

    final data = await scoresRef.once();

    if (data.snapshot.children.length < 20) {
      return true;
    }

    for (var s in data.snapshot.children) {
      final scoreInfo = Map<String, dynamic>.from(s.value as Map);

      if (score <= scoreInfo['score']) {
        return true;
      }
    }

    return false;
  }
}
