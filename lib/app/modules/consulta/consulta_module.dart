
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import '../consulta/consulta_store.dart'; 

import 'consulta_page.dart';
 
class ConsultaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConsultaStore()),
    Bind.singleton((i) => Loggin()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => ConsultaPage()),
 ];
}