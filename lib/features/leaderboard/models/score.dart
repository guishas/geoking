class Score {
  String? name;
  String? country;
  int? score;

  Score({
    this.name,
    this.score,
    this.country,
  });

  Score.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "country": country,
      "score": score,
    };
  }
}
