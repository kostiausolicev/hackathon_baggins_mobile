class SuccessAuthDto {
  String token;
  String role;

  SuccessAuthDto({
    required this.token,
    required this.role,
  });

  factory SuccessAuthDto.fromJson(Map<String, dynamic> json) {
    return SuccessAuthDto(
      token: json['token'],
      role: json['role'],
    );
  }
}