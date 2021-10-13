import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/login/login_module.dart';
import '../search/search_store.dart';
import '../home/home_store.dart';

import 'search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore()),
    Bind.singleton((i) => HomeStore()),
  ];

  @override
  List<Module> get imports => [LoginModule()];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SearchPage()),
  ];
}
