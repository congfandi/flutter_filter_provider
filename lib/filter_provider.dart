import 'package:filter_provider/home_provider.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  final HomeProvider hp;

  FilterProvider(this.hp);
}
