import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/order_model.dart';

class UserServices
{



  static Future<void> makeOrder({required Order order}) async
  {
    await FirebaseFirestore.instance.collection('Orders').doc().set(order.toJson());
  }
  static Future<List<Order>> getMyOrders({required String userId}) async
  {
    List<Order> orders=[];
    await FirebaseFirestore.instance.collection('Orders').where('userId' , isEqualTo: userId).get().then((value){
      for(int i=0 ; i<value.docs.length ; i++)
      {
        orders.add(Order.fromJson(value.docs[i].data()));
      }
    });
    return orders;
  }



}