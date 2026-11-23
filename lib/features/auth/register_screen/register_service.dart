import 'package:dio/dio.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';
import '../../../core/prefs_manager/prefs_manager.dart';
import '../../../models/register_response_model.dart';

abstract final class RegisterService {
  static Future<RegisterResponseModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await ApiManager.postData(
        url: EndPoints.register,
        data: {
          'firstName': firstName.trim(),
          'lastName': lastName.trim(),
          'email': email.trim(),
          'password': password,
          'phone': phone.trim(),
        },
      );

      final model = RegisterResponseModel.fromJson(response.data as Map<String, dynamic>);

      if (model.statusCode == 200 || response.statusCode == 200 || response.statusCode == 201) {
        await PrefsManager.saveUserData(
          parentId: model.parentId,
          fullName: model.fullName,
          email: model.email,
        );
      }

      return model;
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        return RegisterResponseModel.fromJson(e.response!.data as Map<String, dynamic>);
      }
      return RegisterResponseModel(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? 'Registration failed',
      );
    } catch (e) {
      return RegisterResponseModel(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }
}
