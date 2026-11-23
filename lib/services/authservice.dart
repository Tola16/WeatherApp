import 'package:dio/dio.dart';
import 'package:weatherapp/models/auth.dart';

class Authservice {
  static Dio dio = Dio();
  static Future<Auth> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return Auth.Fromjson(response.data);
    } on DioException catch (dioError) {
      final details =
          dioError.response?.data ?? dioError.message ?? 'Request failed';
      throw Exception(details);
    } catch (other) {
      throw Exception("Other error: ${other.toString()}");
    }
  }

  static Future<Auth> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    Response response = await dio.post(
      "https://elsewedyteam.runasp.net/api/Register/AddUser",
      data: {
        "Name": name,
        "Email": email,
        "Phone": phone,
        "Password": password,
      },
    );
    return Auth.Fromjson(response.data);
  }
}
