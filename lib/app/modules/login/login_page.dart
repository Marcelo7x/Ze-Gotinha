import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/login/login_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height; //screen height
    double _width = MediaQuery.of(context).size.width; //screen width

    final _username = TextEditingController();
    final _password = TextEditingController();

    getUser() {
      final user = Modular.get(defaultValue: Loggin.loggin);
      return user;
    }

    return Scaffold(
      body: Container(
        //* ******************************************************************** Backgroud
        color: Theme.of(context).colorScheme.primary,
        height: _height,
        width: _width,
        child: Column(
          children: [
            Padding(
              //****************************************************************Title
              padding: const EdgeInsets.all(70),
              child: Text(
                "Zé Gotinha",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.none,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                          color: Colors.white60,
                          offset: Offset.fromDirection(1, 5),
                          blurRadius: 1)
                    ]),
              ),
            ),
            Container(
              //**************************************************************** White box
              height: _height * .4,
              width: _width * .3,
              //color: ThemeData.light().cardColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //***********************************************************Login
                    width: _width * .25,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          //login
                          controller: _username,
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              hintText: "Úsuario"),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    //********************************************************** Password
                    width: _width * .25,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          //login
                          controller: _password,
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.password,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              hintText: "Senha"),
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                      //*********************************************************Loggin Button */
                      margin: const EdgeInsets.only(top: 20),
                      width: 120,
                      height: 50,
                      child: elevatedButton(context, "Entrar", () async {
                        controller.setUserPassword(_username.text.toString(),
                            _password.text.toString());
                        //controller.login();

                        // controller.logginError == false
                        //     ? Modular.to.pushNamed("/home-medico/")
                        //     : () {};

                        if (await controller.login()) {
                          Modular.to.pushNamed("/home/${getUser()["type"]}/");
                        }
                      })),
                  Padding(
                      //********************************************************Error text
                      padding: const EdgeInsets.only(top: 20),
                      child: Observer(builder: (_) {
                        return Text(
                          controller.logginError
                              ? "Senha ou Úsuario incorreto. Verifique e tente novamente."
                              : "",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        );
                      }))
                ],
              ),
            ),
            Container(
              // "final text"
              width: _width * .3,
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Não tem conta? ",
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(
                        fontSize: 19,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
