import 'package:mobx/mobx.dart';

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
    else return 'Nome muito curto';
  }

}