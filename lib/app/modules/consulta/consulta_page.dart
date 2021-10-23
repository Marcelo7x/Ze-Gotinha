import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class ConsultaPage extends StatefulWidget {
  final String title;
  const ConsultaPage({Key? key, this.title = "Consulta"}) : super(key: key);

  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends ModularState<ConsultaPage, ConsultaStore> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _sintomas = TextEditingController();
    final _fileInput = TextEditingController();

    //final Map _user = Modular.get(defaultValue: Loggin.loggin);

    return Container(
        padding: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        //********************************************************** Histórico
                        height: 40,
                        child: elevatedButton(
                            context,
                            const Text("Hístorico",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )), () {
                          Modular.to.pushNamed("/home/consulta/historico/");
                        })),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: SizedBox(
                          height: 40,
                          child: elevatedButton(
                              //********************************************************** Cartao de Vacina
                              context,
                              const Text("Cartão de Vacina",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )), () {
                            Modular.to.pushNamed("/home/vacina/");
                          })),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    //********************************************************** Sistomas
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Sintomas", style: TextStyle(fontSize: 20)),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(5),
                        height: _height * .35,
                        width: _width * .30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                        child: TextField(
                          controller: _sintomas,
                          maxLines: 20,
                          style: TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    //********************************************************** Selecionar arquivo
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Arquivo", style: TextStyle(fontSize: 20)),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(16),
                                  right: Radius.circular(16)),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              Container(
                                width: _width * .15,
                                height: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  //login
                                  controller: _fileInput,
                                  autofocus: true,
                                  maxLines: 2,
                                  cursorWidth: 0,
                                  mouseCursor: MouseCursor.uncontrolled,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.file_upload,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                  ),
                                  style: const TextStyle(fontSize: 10),
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();

                                    if (result != null) {
                                      File file =
                                          File(result.files.single.name);
                                      _fileInput.text = file.toString();
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                ),
                              ),
                              Container(
                                //********************************************************* Selecionar arquivo */
                                width: _width * .07,
                                height: 40,
                                child: elevatedButton(
                                    context,
                                    const Text("Selecionar",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )), () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    File file = File(result.files.single.name);
                                    _fileInput.text = file.toString();
                                  } else {
                                    // User canceled the picker
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      //*****************************************Gerar Receita */
                      height: 40,
                      child: elevatedButton(
                          context,
                          const Text("Gerar Receita",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )), () {
                        Modular.to.pushNamed("/home/consulta/receita/");
                      })),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: SizedBox(
                        //***************************************** Cancelar
                        height: 40,
                        child: elevatedButton(
                            context,
                            const Text("Cancelar",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )), () async {
                          await _popup(
                              context, "Consulta cancelada com sucesso");
                          Modular.to.pushNamed("/home/");
                        })),
                  ),
                ],
              ),
            ]));
  }
}

_popup(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(msg),
      actions: [
        elevatedButton(
            context,
            const Text("OK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )), () {
          Navigator.pop(context);
        }),
      ],
    ),
  );
}
