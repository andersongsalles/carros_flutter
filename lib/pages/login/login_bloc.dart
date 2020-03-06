import 'dart:async';

import 'package:carros_flutter/pages/api_response.dart';
import 'package:carros_flutter/pages/carro/simple_bloc.dart';
import 'package:carros_flutter/pages/login/login_api.dart';
import 'package:carros_flutter/pages/login/usuario.dart';

//Usando composição
class LoginBloc {
  final buttonBloc = BooleanBloc();

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    buttonBloc.add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    buttonBloc.add(false);

    return response;
  }

  void dispose(){
    buttonBloc.dispose();
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
