import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/search/search_store.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      //********************************************************* Search */
      child: Column(
        children: [
          Container(
            width: _width * .46,
            height: 50,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20)),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: _width * .35,
                  height: 50,
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                      //login
                      //controller: ,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.person,
                              color: Theme.of(context).colorScheme.secondary),
                          hintText: "Digite o nome do Paciente"),
                      style: TextStyle(fontSize: 20)),
                ),
                Container(
                    //********************************************************* Search Button */
                    //margin: const EdgeInsets.only(top: 20),
                    width: _width * .1,
                    height: 50,
                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Theme.of(context).colorScheme.secondary;
                              }
                              return ThemeData.light()
                                  .primaryColor; // Use the component's default.
                            },
                          ),
                        ),
                        child: const Text("Busca Paciente",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )))),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
