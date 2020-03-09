import 'dart:async';

import 'package:carros_flutter/pages/api_response.dart';
import 'package:carros_flutter/pages/login/login_api.dart';
import 'package:carros_flutter/pages/login/usuario.dart';
import 'package:carros_flutter/utils/simple_bloc.dart';

//Usando composição
class LoginBloc extends BooleanBloc{
  
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}

/*Usando Herança
class LoginBloc extends SimpleBloc<bool> {

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}*/
