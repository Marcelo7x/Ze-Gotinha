import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/cartao_vacina/cartao_vacina_module.dart';
import 'package:ze_gotinha/app/modules/cartao_vacina/cartao_vacina_store.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_module.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_store.dart';
import 'package:ze_gotinha/app/modules/search/search_module.dart';
import 'package:ze_gotinha/app/modules/search/search_store.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_module.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_store.dart';
import '../home/home_store.dart'; 

import 'home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore()),
    Bind.lazySingleton((i) => CartaoVacinaStore()),
    Bind.lazySingleton((i) => ConsultaStore()),
    Bind.lazySingleton((i) => SearchStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(), children: [
   ModuleRoute("/vacina", module: VacinaModule()),
   ModuleRoute("/consulta", module: ConsultaModule()),
   ModuleRoute("/search", module: SearchModule()),
   ModuleRoute("/cartao_vacina", module: CartaoVacinaModule()),

   ])
 ];
}