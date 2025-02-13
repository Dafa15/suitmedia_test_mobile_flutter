import 'package:dio/dio.dart';
import 'package:suitmedia_test_mobile_flutter/core/exception/custom_exception.dart';
import 'package:suitmedia_test_mobile_flutter/core/network/api_client.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_response.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository(this.apiClient);

  Future<List<UserEntity>?> getListUser(
      {required int pageKey, required int pageSize}) async {
    try {
      final response = await apiClient.dio.get("/users",
          queryParameters: {"page": pageKey, "per_page": pageSize});

      final listUserResponse = UserResponse.fromJson(response.data);

      return listUserResponse.data;
    } on DioException catch (_) {
      throw CustomException("Failed to get User List");
    }
  }
}
