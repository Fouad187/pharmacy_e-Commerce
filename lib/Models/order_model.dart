import 'package:e_commerce/Models/Product.dart';

class Order
{
  late String userName;
  late String userId;
  late List<Product> order;
  late double totalPrice;
  late String address;
  late String status;
  late DateTime date;
  String? docId;
  Order({required this.userName , required this.totalPrice , required this.address , required this.order,
  required this.userId , required this.date , required this.status
  });

  Order.fromJson(Map<String,dynamic> map)
  {
    if(map==null)
      {
        return;
      }
    else
      {
        userName=map['userName'];
        userId=map['userId'];
        if(map['order'] != null)
          {
            order=[];
            map['order'].forEach((pro) {
              order.add(Product.fromJson(pro));
            });
          }
        totalPrice=map['totalPrice'];
        address=map['address'];
        status=map['status'];
        date=map['date'].toDate();

      }
  }
  toJson()
  {
    return {
      'userName' : userName,
      'userId': userId,
      'order' : order.map((e) => e.toJson()).toList(),
      'totalPrice':totalPrice,
      'address' : address,
      'date' : date,
      'status':status,

    };
  }
}