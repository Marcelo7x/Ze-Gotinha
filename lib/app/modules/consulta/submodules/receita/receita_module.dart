import 'package:flutter_modular/flutter_modular.dart';
import '../receita/receita_store.dart'; 

import 'receita_page.dart';
 
class ReceitaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReceitaStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => ReceitaPage()),
 ];
}