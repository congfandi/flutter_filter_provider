import 'package:filter_provider/filter_page.dart';
import 'package:filter_provider/home_provider.dart';
import 'package:filter_provider/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new HomeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filter Provider"),
          actions: <Widget>[
            Consumer<HomeProvider>(
              builder: (_, hp, __) => IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    hp.setData();
                  }),
            ),
            Consumer<HomeProvider>(
              builder: (_, hp, __) => IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FilterPage(hp)));
                  }),
            ),
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (context, hp, __) => hp.data.isEmpty
              ? Container()
              : GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      hp.data.length, (i) => _item(context, hp.data[i])),
                ),
        ),
      ),
    );
  }

  _item(BuildContext context, ItemModel itemModel) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 8, left: 8),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      color: itemModel.color,
      child: Center(
          child: Text(
        '${itemModel.name}',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
