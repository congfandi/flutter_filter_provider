import 'package:filter_provider/providers/filter_provider.dart';
import 'package:filter_provider/providers/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  final HomeProvider hp;

  FilterPage(this.hp);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => new FilterProvider(hp, context),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Filter Page"),
          ),
          body: Container(
            margin: EdgeInsets.all(32.0),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Consumer<FilterProvider>(
                    builder: (_, fp, __) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Semua Data'),
                          leading: Radio(
                            value: Filter.semua,
                            groupValue: fp.currentFilter,
                            onChanged: (Filter value) {
                              fp.setFilter(value);
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Data Ganjil'),
                          leading: Radio(
                            value: Filter.ganjil,
                            groupValue: fp.currentFilter,
                            onChanged: (Filter value) {
                              fp.setFilter(value);
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Data Genap'),
                          leading: Radio(
                            value: Filter.genap,
                            groupValue: fp.currentFilter,
                            onChanged: (Filter value) {
                              fp.setFilter(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                      child: Text(
                        "Batal",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Consumer<FilterProvider>(
                      builder: (_, fp, __) => RaisedButton(
                        onPressed: () {
                          fp.doFilter();
                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        child: Text(
                          "FIiter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
