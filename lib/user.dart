import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:learnify/constants.dart';

class User {
  late Dio dio;

  User() {
    BaseOptions options = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {
        "Accept": "application/json",
      },
    );

    dio = Dio(options);
    dio.interceptors.add(CookieManager(CookieJar()));

    dio.options.extra['withCredentials'] = true;
  }

  Future<bool> isLogin() async {
    var data = await dio.get(apiIsLogin);

    return data.data['success'];
  }

  Future<dynamic> login(String user, String password) async {
    dynamic value;
    try {
      value = await dio.post(apiLogin,
          queryParameters: {"username": user, "password": password});
    } on DioError catch (e) {
      value = e.response;
    }

    if (!await isLogin()) {
      throw Exception("Login failed");
    }

    return value.data;
  }

  Future<dynamic> register(String user, String email, String password) async {
    dynamic value;
    try {
      value = await dio.get(apiRegister,
          queryParameters: {"name": user, "email": email, "passwd": password});
    } on DioError catch (e) {
      value = e.response;
    }

    if (await value.data['success'] == false) {
      throw Exception(value.data['err']['message'].toString());
    }

    await login(user, password);

    return value.data;
  }

  Future<void> logout() async {
    await dio.get(apiLogout);
  }
}
