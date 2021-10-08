import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  bool logginError = false;

  @observable
  String username = "";

  @observable
  String password = "";

  @action
  setUserPassword(String u, String p) {
    print(u);
    print(p);
    username = u;
    password = p;
  }

  @action
  bool login() {
    if (username != "admin") {
      logginError = true;
      return !logginError;
    } else if (username == "admin") {
      logginError = false;
    }
    
    if (password != "admin") {
      logginError = true;
      return !logginError;
    } else if (password == "admin") {
      logginError = false;
    }

    return !logginError;
  }
}
