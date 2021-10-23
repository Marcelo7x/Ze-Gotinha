import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/receita/receita_module.dart';
import 'package:ze_gotinha/app/modules/login/login_module.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

import 'modules/consulta/consulta_module.dart';
import 'modules/consulta/consulta_store.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/home_enfermeiro/home_enfermeiro_module.dart';
import 'modules/home_enfermeiro/home_enfermeiro_store.dart';
import 'modules/search/search_store.dart';
import 'modules/vacina/vacina_module.dart';
import 'modules/vacina/vacina_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => HomeEnfermeiroStore()),
    Bind.singleton((i) => BD()),
    Bind.lazySingleton((i) => VacinaStore()),
    Bind.lazySingleton((i) => ConsultaStore()),
    Bind.lazySingleton((i) => SearchStore()),
    Bind.lazySingleton((i) => Loggin()),
    Bind.lazySingleton((i) => elevatedButton),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home/", module: HomeModule()),
    ModuleRoute("/vacina/", module: VacinaModule()),
    ModuleRoute("/consulta/", module: ConsultaModule()),
    ModuleRoute("/receita/", module: ReceitaModule()),
    ModuleRoute("/home-enfermeiro/", module: HomeEnfermeiroModule()),
  ];

}