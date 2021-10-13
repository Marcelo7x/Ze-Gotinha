import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_page.dart';
import 'package:ze_gotinha/app/modules/home/home_store.dart';
import 'package:ze_gotinha/app/modules/search/search_page.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_page.dart';

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

    //var _medico = Modular.args.data as Medico; //recebe o agrumento
    //final Map _user = Modular.get(defaultValue: Loggin.loggin);

    final _searchController = TextEditingController();

    _tabController(int option) {
      //var oldPg = controller.page;
      switch (option) {
        case 0:
          controller.setpage(SearchPage());
          break;
        case 1:
          controller.setpage(VacinaPage());
          break;
        case 2:
          controller.setpage(ConsultaPage());
          break;
        case 3:
          controller.setpage(Container());
          break;
      }
    }

    _tabController(0); //Fazer o Search aparecer como padrao
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: TabBar(
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
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
          Observer(builder: (_) {
            return Container(
                //**************************************************************** White box
                height: _height * .75,
                width: _width * .6,
                margin: const EdgeInsets.only(top: 40),
                //color: ThemeData.light().cardColor,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: controller.page);
          })
        ]),
      ),
    );
  }
}
