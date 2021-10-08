import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_store.dart';

class VacinaPage extends StatefulWidget {
  final String title;
  const VacinaPage({Key? key, this.title = "Vacina"}) : super(key: key);

  @override
  _VacinaPageState createState() => _VacinaPageState();
}

class _VacinaPageState extends ModularState<VacinaPage, VacinaStore> {


  @override
  Widget build(BuildContext context) {
    
    return Container(child: Text("Vacina"));
  }

}
