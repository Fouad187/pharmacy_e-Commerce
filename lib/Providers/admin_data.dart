import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Services/Admin_Services.dart';
import 'package:flutter/cupertino.dart';

class AdminData extends ChangeNotifier
{
  UserModel? user;
  List<Product> medicines=[];
  List<Product> equipments=[];
  List<Product> supplies=[];
  List<Order> orders=[];
  List<Order> allOrders=[];
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
  removeFromOrders({required int index})
  {
    orders.removeAt(index);
    notifyListeners();
  }

  getAdminOrders()
  {
    AdminServices.getOrders().then((value) {
      orders=value;
      notifyListeners();
    });
  }
  Future<void> getAllOrders() async
  {
    AdminServices.getAllOrders().then((value) {
      allOrders=value;
      notifyListeners();
    });
  }

  Future<void> getSupplies() async
  {
    AdminServices.getSupplies().then((value) {
      supplies=value;
      notifyListeners();
    });
  }
  Future<void> getMedicine() async
  {
    AdminServices.getMedicine().then((value) {
      medicines=value;
      notifyListeners();
    });
  }
  Future<void> getEquipment() async
  {
    AdminServices.getEquipment().then((value) {
      equipments=value;
      notifyListeners();
    });
  }
}