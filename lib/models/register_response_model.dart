class RegisterResponseModel {
  final int? statusCode;
  final String? message;
  final int? parentId;
  final String? fullName;
  final String? email;

  RegisterResponseModel({
    this.statusCode,
    this.message,
    this.parentId,
    this.fullName,
    this.email,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      parentId: json['parentId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
    );
  }
}
