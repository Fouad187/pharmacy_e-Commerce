import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Services/Admin_Services.dart';
import 'package:e_commerce/Services/user_services.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier
{
  UserModel? user;
  List<Product> medicines=[];
  List<Product> equipments=[];
  List<Product> supplies=[];
  List<Order> orders=[];

  setUser(UserModel user)
  {
    this.user=user;
  }

 getMedicine ()
 {
   if(medicines.length==0)
     {
       AdminServices.getMedicine().then((value) {
         medicines=value;
         notifyListeners();
       });
     }
 }

 getEquipments ()
 {
    if(equipments.length==0)
    {
      AdminServices.getEquipment().then((value) {
        equipments=value;
        notifyListeners();
      });
    }
  }

  getSupplies ()
  {
    if(supplies.length==0)
    {
      AdminServices.getSupplies().then((value) {
        supplies=value;
        notifyListeners();
      });
    }
  }

  Future<void> getOrders() async
  {
    UserServices.getMyOrders(userId: user!.id).then((value) {
      orders=value;
      notifyListeners();
    });
  }

}