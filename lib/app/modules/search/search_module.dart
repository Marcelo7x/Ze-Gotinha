
import 'package:flutter_modular/flutter_modular.dart';
import '../search/search_store.dart'; 

import 'search_page.dart';
 
class SearchModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => SearchStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => SearchPage()),
 ];
}