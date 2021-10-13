import 'package:ze_gotinha/app/modules/class/Enfermeiro.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

class Loggin { //gerencia o login, //TODO: escrevi login errado, tem de consertar
                //TODO: amazenar informacoes de login em algum cache assim dispensando usar essa class statica sempre
  static Usuario? _usuario;
  static Medico? _medico;
  static Enfermeiro? _enfermeiro;

  static bool setLoggin(
      {Usuario? usuario, Medico? medico, Enfermeiro? enfermeiro}) {
    print("setLoggin");
    if (usuario != null) {
      _usuario = usuario;
      return true;
    } else if (medico != null) {
      _medico = medico;
      return true;
    } else if (enfermeiro != null) {
      _enfermeiro = enfermeiro;
      return true;
    } else {
      return false;
    }
  }

  static Map get loggin {
    return _usuario != null
        ? {"user": _usuario!.name.toString(), "type": "usuario"}
        : _medico != null
            ? {"user": _medico!.crm.toString(), "type": "medico"}
            : {"user": _enfermeiro!.corem.toString(), "type": "enfermeiro"};
  }
}
