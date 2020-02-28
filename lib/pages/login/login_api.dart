import 'dart:convert';
import 'package:carros_flutter/pages/api_response.dart';
import 'file:///D:/dev/carros_flutter/carros_flutter/lib/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {"username": login, "password": senha};

      String s = json.encode(params);
      print("> $s");

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if(response.statusCode == 200){
        final user = Usuario.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro do login $error > $exception");
      return ApiResponse.error("Não foi posssível fazer o login");
    }
  }
}