import 'package:dio/dio.dart';
import 'package:random_user_app/models/user_model.dart';

class UserService {
  static final Dio dio = Dio();
  static Future<Users> getUsers() async {
    try {
      Response response = await dio.get(
        "https://randomuser.me/api/?results=50",
      );
      return Users.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (antotherException) {
      throw Exception(antotherException.toString());
    }
  }
}
