import 'package:learnify/util/user.dart';

const String apiUrl = "https://localhost";

const String apiLogin = "$apiUrl/login";
const String apiLogout = "$apiUrl/logout";
const String apiRegister = "$apiUrl/register";
const String apiIsLogin = "$apiUrl/islogin";

User user = User();

typedef BoolCallback = void Function(bool);
