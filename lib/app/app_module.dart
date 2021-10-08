import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/login/login_module.dart';

import 'modules/consulta/consulta_module.dart';
import 'modules/home/home_module.dart';
import 'modules/vacina/vacina_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home-medico", module: HomeModule()),
    // ModuleRoute("/vacina", module: VacinaModule()),
    // ModuleRoute("/consulta", module: ConsultaModule()),
  ];

}