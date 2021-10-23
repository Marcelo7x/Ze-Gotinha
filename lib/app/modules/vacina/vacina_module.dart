
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/cartao_vacina/cartao_vacina_module.dart';
import 'package:ze_gotinha/app/modules/cartao_vacina/cartao_vacina_store.dart';
import '../vacina/vacina_store.dart'; 

import 'vacina_page.dart';
 
class VacinaModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => VacinaStore()),
 Bind.lazySingleton((i) => CartaoVacinaStore())
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => VacinaPage(), children: [
     ModuleRoute("/cartao", module: CartaoVacinaModule())
   ]
   ),
 ];
}