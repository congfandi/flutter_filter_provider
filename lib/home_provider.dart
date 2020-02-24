import 'package:filter_provider/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_provider.dart';

class HomeProvider with ChangeNotifier {
  var data = List<ItemModel>();
  Filter filter = Filter.semua;

  setData() {
    data.clear();
    for (var i = 0; i < 100; i++) {
      data.add(new ItemModel('Item ${i + 1}', 'code $i', Colors.blue));
    }
    notifyListeners();
  }

//  filter

  tampilkanSemua() {
    filter = Filter.semua;
    setData();
  }

  tampilkanGenap() {
    filter = Filter.genap;
    for (var i = 0; i < data.length; i++) {
      if ((i + 1) % 2 == 0) {
        data.removeAt(i);
      }
    }
    notifyListeners();
  }

  tampilkanGanjil() {
    filter = Filter.ganjil;
    for (var i = 0; i < data.length; i++) {
      if ((i + 1) % 2 != 0) {
        data.removeAt(i);
      }
    }
    notifyListeners();
  }
}
