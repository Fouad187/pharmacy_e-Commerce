import 'package:e_commerce/Models/Equipment.dart';
import 'package:e_commerce/Models/Medicine.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:flutter/cupertino.dart';

class AdminData extends ChangeNotifier
{
  UserModel? user;
  List<Medicine> medicines=[];
  List<EquipmentAndSupplies> equipments=[];
  List<EquipmentAndSupplies> supplies=[];
  setUser(UserModel user)
  {
    this.user=user;
  }
  removeFromMedicine({required int index})
  {
    medicines.removeAt(index);
    notifyListeners();
  }
  removeFromEquipment({required int index})
  {
    equipments.removeAt(index);
    notifyListeners();
  }
  removeFromSupplies({required int index})
  {
    supplies.removeAt(index);
    notifyListeners();
  }


}