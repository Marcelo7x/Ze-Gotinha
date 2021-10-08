import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_module.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_store.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_module.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_store.dart';
import '../home/home_store.dart'; 

import 'home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => VacinaStore()),
    Bind.lazySingleton((i) => ConsultaStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
   ModuleRoute("/vacina", module: VacinaModule()),
   ModuleRoute("/consulta", module: ConsultaModule()),
 ];
}