import 'package:flutter_carros/pages/login/login_api.dart';
import 'package:flutter_carros/pages/login/user_model.dart';

import '../../api_response.dart';
import '../../utils/simples_bloc.dart';

class LoginBloc extends BooleanBloc {
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);

    ApiResponse<Usuario> response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}
