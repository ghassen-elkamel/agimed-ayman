List<Week> weeksFromJson(dynamic str) =>
    List<Week>.from(str["items"].map((x) => Week.fromJson(x)));

class Week {
  final int? code;
  final String designation;
  final int? weekIndex;

  Week({
    this.code,
    required this.designation,
    this.weekIndex,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      code: json["code"],
      designation: json["designation"],
      weekIndex: json["weekIndex"],
    );
  }
}
