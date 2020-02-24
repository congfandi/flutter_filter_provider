import 'package:filter_provider/filter_provider.dart';
import 'package:filter_provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  final HomeProvider hp;

  FilterPage(this.hp);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new FilterProvider(hp),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Filter Page"),
          ),
          body: Center(
            child: RaisedButton(
              onPressed: () {
                hp.hapusGenap();
              },
              child: Text("filter"),
            ),
          ),
        ));
  }
}
