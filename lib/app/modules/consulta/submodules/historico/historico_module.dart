import 'package:flutter_modular/flutter_modular.dart';
import '../historico/historico_store.dart'; 

import 'historico_page.dart';
 
class HistoricoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HistoricoStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HistoricoPage()),
 ];
}