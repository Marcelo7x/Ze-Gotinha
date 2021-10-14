
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/historico/historico_module.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/historico/historico_store.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/receita/receita_module.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/receita/receita_store.dart';
import '../consulta/consulta_store.dart'; 

import 'consulta_page.dart';
 
class ConsultaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConsultaStore()),
    Bind.lazySingleton((i) => ReceitaStore()),
    Bind.lazySingleton((i) => HistoricoStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => ConsultaPage()),
    ModuleRoute("/receita/",module: ReceitaModule()),
    ModuleRoute("/historico/",module: HistoricoModule()),
 ];
}