import 'package:filter_provider/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  var data = List<ItemModel>();

  setData() {
    data.clear();
    for (var i = 0; i < 100; i++) {
      data.add(new ItemModel('Item $i', 'code $i', Colors.blue));
    }
    notifyListeners();
  }

//  filter

  hapusGenap() {
    for (var i = 0; i < data.length; i++) {
      if (i % 2 == 0) {
        data.removeAt(i);
      }
    }
    notifyListeners();
  }
}
