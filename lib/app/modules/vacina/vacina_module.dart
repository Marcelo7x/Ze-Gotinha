
import 'package:flutter_modular/flutter_modular.dart';
import '../vacina/vacina_store.dart'; 

import 'vacina_page.dart';
 
class VacinaModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => VacinaStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => VacinaPage()),
 ];
}