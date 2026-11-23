import 'package:dio/dio.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';
import '../../../core/prefs_manager/prefs_manager.dart';
import '../../../models/login_response_model.dart';

abstract final class LoginService {
  static Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiManager.postData(
        url: EndPoints.login,
        data: {
          'email': email.trim(),
          'password': password,
        },
      );

      final model = LoginResponseModel.fromJson(response.data as Map<String, dynamic>);

      if (model.statusCode == 200 || response.statusCode == 200 || response.statusCode == 201) {
        await PrefsManager.saveUserData(
          parentId: model.parentId,
          fullName: model.fullName,
          email: model.email,
          phone: model.phone,
        );
      }

      return model;
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        return LoginResponseModel.fromJson(e.response!.data as Map<String, dynamic>);
      }
      return LoginResponseModel(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      );
    } catch (e) {
      return LoginResponseModel(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }
}
