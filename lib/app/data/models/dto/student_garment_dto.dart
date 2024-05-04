class StudentGarmentDto {
  int studentCode;
  int garmentCode;
  String status;

  StudentGarmentDto({
    required this.studentCode,
    required this.garmentCode,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        "studentCode": studentCode,
        "garmentCode": garmentCode,
        "status": status,
      };
}
