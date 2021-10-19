
import 'package:flutter_modular/flutter_modular.dart';
import '../cartao_vacina/cartao_vacina_store.dart'; 

import 'cartao_vacina_page.dart';
 
class CartaoVacinaModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => CartaoVacinaStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => CartaoVacinaPage()),
 ];
}