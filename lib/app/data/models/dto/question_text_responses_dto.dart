class QuestionTextResponsesDto {
  List<String> items;

  QuestionTextResponsesDto({required this.items});

  factory QuestionTextResponsesDto.fromJson(Map<String, dynamic> json) {
    return QuestionTextResponsesDto(
      items: json['items'] != null ? List<String>.from(json['items']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items,
    };
  }
}
