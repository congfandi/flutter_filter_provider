import 'package:filter_provider/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_provider.dart';

class HomeProvider with ChangeNotifier {
  var data = List<ItemModel>();
  Filter filter = Filter.semua;

  setData() {
    filter = Filter.semua;
    data.clear();
    for (var i = 0; i < 100; i++) {
      data.add(new ItemModel('Item ${i + 1}', i + 1, Colors.blue));
    }
    notifyListeners();
  }

//  filter

  tampilkanSemua() {
    filter = Filter.semua;
    setData();
  }

  tampilkanGenap() {
    setData();
    filter = Filter.genap;
    for (var i = 0; i < data.length; i++) {
      if (data[i].code % 2 == 1) {
        data.removeAt(i);
      }
    }
    notifyListeners();
  }

  tampilkanGanjil() {
    setData();
    filter = Filter.ganjil;
    for (var i = 0; i < data.length; i++) {
      if (data[i].code % 2 == 0) {
        data.removeAt(i);
      }
    }
    notifyListeners();
  }
}
