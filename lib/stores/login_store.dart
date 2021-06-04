import 'package:mobx/mobx.dart';
import 'package:olx_clone/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailValid => email != null && email.isEmailValid();
  String get emailError => email == null || isEmailValid ? null : 'E-mail inválido';

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid => password!= null && password.length >= 8;
  String get passwordError => password == null || isPasswordValid ? null : 'Senha inválida';

  @computed
  Function get loginPressed => isEmailValid && isPasswordValid ? _login : null;

  @observable
  bool isLoading = false;

  @action
  Future<void> _login() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
  }

}