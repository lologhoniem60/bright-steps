class LoginResponseModel {
  final int? statusCode;
  final String? message;
  final int? parentId;
  final String? fullName;
  final String? email;
  final String? phone;

  LoginResponseModel({
    this.statusCode,
    this.message,
    this.parentId,
    this.fullName,
    this.email,
    this.phone,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      parentId: json['parentId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }
}
