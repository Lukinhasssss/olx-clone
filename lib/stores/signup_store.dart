import 'package:mobx/mobx.dart';
import 'package:olx_clone/helpers/extensions.dart';
import 'package:olx_clone/models/user.dart';
import 'package:olx_clone/repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get isNameValid => name != null && name.length > 6;
  String get nameError {
    if (name== null || isNameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email;
  
  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || isEmailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get isPhoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || isPhoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Celular inválido';
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get isPass1Valid => pass1 != null && pass1.length >= 8;
  String get pass1Error {
    if (pass1 == null || isPass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get isPass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || isPass2Valid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid => isNameValid && isEmailValid && isPhoneValid && isPass1Valid && isPass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !isLoading) ? _signUp : null;

  @observable
  bool isLoading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    isLoading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: pass1
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      print(resultUser);
    } catch (e) {
      error = e;
    }

    isLoading = false;
  }

}