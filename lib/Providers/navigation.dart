import 'package:flutter/cupertino.dart';

class BottomNavigation extends ChangeNotifier
{
  int selectedIndex=0;
  navigate({required int index})
  {
    selectedIndex=index;
    notifyListeners();
  }


}