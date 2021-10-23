import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/home_enfermeiro/home_enfermeiro_store.dart';

import 'package:ze_gotinha/app/modules/widgets/button.dart';

class HomeEnfermeiroPage extends StatefulWidget {
  final String title;
  const HomeEnfermeiroPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomeEnfermeiroPageState createState() => _HomeEnfermeiroPageState();
}

class _HomeEnfermeiroPageState
    extends ModularState<HomeEnfermeiroPage, HomeEnfermeiroStore> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height; //screen height
    double _width = MediaQuery.of(context).size.width; //screen width

    _searchPageEnfermeiro() {
      return Container(
        height: _height * .7,
        width: _width * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: elevatedButton(
                  context,
                  const Text(
                    "Ler QR Code",
                    style: TextStyle(fontSize: 18),
                  ), () async {
                controller.setQR(q: true);
                await controller.getUser();
                if (await controller
                    .vinculo(int.parse(controller.enfermeiro!))) {
                  await _popup(context, "Paciente Vinculado com Sucesso");
                  controller.setIndex(1);
                  Modular.to.navigate("/home-enfermeiro/vacina/");
                }
                controller.setQR(q: false);
              }),
            ),
            Observer(builder: (_) {
              return Container(
                width: _height * .25,
                height: _height * .25,
                color: controller.qr ? Colors.black : Colors.white,
              );
            })
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        //* ******************************************************************** Backgroud
        color: Theme.of(context).colorScheme.background,
        height: _height,
        width: _width,
        child: Column(children: [
          Container(
            //********************************************************* Navigation bar */
            margin: const EdgeInsets.only(top: 40),
            width: _width * .5,
            height: _height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.setIndex(0);
                        controller.getPage(0);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 0 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.home),
                            text: "Zé Gotinha",
                          ),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () async {
                        if (await _buscaPaciente() == false) {
                          _popup(context,
                              "Selecione um paciente que já esteja vinculado e tente novamente.");
                        } else {
                          controller.setIndex(1);
                          controller.getPage(1);
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 1 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.document_scanner_outlined),
                            text: "Cartão de Vacina",
                          ),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.setIndex(3);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 3 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.person),
                            text: "Usuário",
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Container(
              //**************************************************************** White box
              height: _height * .75,
              width: _width * .6,
              margin: const EdgeInsets.only(top: 40),
              //color: ThemeData.light().cardColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Observer(builder: (_) {
                return PageView(
                  controller: controller.pageViewController,
                  children: [
                    controller.pageIndex == 0
                        ? _searchPageEnfermeiro()
                        : RouterOutlet()
                  ],
                );
              }))
        ]),
      ),
    );
  }
}

Future<bool> _buscaPaciente() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? cpf = prefs.getString("paciente");

  return cpf == null ? false : true;
}

_popup(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(msg),
      actions: [
        elevatedButton(
            context,
            const Text("OK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )), () {
          Navigator.pop(context);
        }),
      ],
    ),
  );
}
