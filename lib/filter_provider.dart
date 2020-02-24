import 'package:filter_provider/home_provider.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  final HomeProvider hp;
  final BuildContext context;
  Filter currentFilter = Filter.semua;

  FilterProvider(this.hp, this.context) {
    currentFilter = hp.filter;
  }

  setFilter(Filter filter) {
    currentFilter = filter;
    notifyListeners();
  }

  doFilter() {
    switch (currentFilter) {
      case Filter.semua:
        hp.tampilkanSemua();
        break;
      case Filter.ganjil:
        hp.tampilkanGanjil();
        break;
      case Filter.genap:
        hp.tampilkanGenap();
        break;
    }
  }
}

enum Filter { semua, ganjil, genap }
