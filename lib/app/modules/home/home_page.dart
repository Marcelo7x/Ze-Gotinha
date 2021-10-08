import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height; //screen height
    double _width = MediaQuery.of(context).size.width; //screen width

    _tabController(int option) {
      switch (option) {
        case 0: print(0); break;
        case 1: print(1);break;
        case 2: print(2);break;
        case 3: print(3);break;
      }

    }

    return Scaffold(
      body: Container(
        //* ******************************************************************** Backgroud
        color: Theme.of(context).colorScheme.background,
        height: _height,
        width: _width,
        child: Column(children: [
          Container( //********************************************************* Navigation bar */
            margin: const EdgeInsets.only(top: 40),
            width: _width * .5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: DefaultTabController(
              length: 4,
              child: TabBar(
                labelColor: Theme.of(context).colorScheme.onSecondary,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.home),
                    text: "Zé Gotinha",
                  ),
                  Tab(
                    icon: Icon(Icons.document_scanner_outlined),
                    text: "Cartão de Vacina",
                  ),
                  Tab(
                    icon: Icon(Icons.medical_services),
                    text: "Consulta",
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                    text: "Úsuario",
                  ),
                ],
                onTap: (int op) => _tabController(op),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
