import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/login/login_module.dart';

import 'modules/consulta/consulta_module.dart';
import 'modules/consulta/consulta_store.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/search/search_store.dart';
import 'modules/vacina/vacina_module.dart';
import 'modules/vacina/vacina_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.singleton((i) => BD()),
    Bind.lazySingleton((i) => VacinaStore()),
    Bind.lazySingleton((i) => ConsultaStore()),
    Bind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home-medico/", module: HomeModule()),
    // ModuleRoute("/vacina/", module: VacinaModule()),
    // ModuleRoute("/consulta/", module: ConsultaModule()),
  ];

}