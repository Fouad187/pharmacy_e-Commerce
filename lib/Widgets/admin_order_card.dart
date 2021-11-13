import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminOrderCard extends StatelessWidget {
  Order order;
  int index;
  AdminOrderCard({required this.order , required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(child: Text('Order Products' , style: TextStyle(fontWeight: FontWeight.w700),),),
              Divider(),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(product: order.order[index]);
                  },
                  itemCount: order.order.length,
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name : ${order.userName}' , style: TextStyle(fontSize: 18),),
                  Text('Address : ${order.address}', style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total : ${order.totalPrice} LE' , style: TextStyle(fontSize: 18),),
                  Text('Date : ${order.date.day} - ${order.date.month} - ${order.date.year}', style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                  width: double.infinity,
                  child: FlatButton(onPressed: () async {
                    await FirebaseFirestore.instance.collection('Orders').doc(order.docId).update(
                        {
                          'status' : 'Accepted'
                        }
                    ).then((value) {
                      Provider.of<AdminData>(context,listen: false).removeFromOrders(index: index);
                    });
                  }, child: const Text('Accept' , style:  TextStyle(color: Colors.white),) , color: Colors.green,)),
              Container(
                  width: double.infinity,
                  child: FlatButton(onPressed: () async {
                    await FirebaseFirestore.instance.collection('Orders').doc(order.docId).update(
                        {
                          'status' : 'Rejected'
                        }
                    ).then((value) {
                      Provider.of<AdminData>(context,listen: false).removeFromOrders(index: index);
                    });
                  }, child: const Text('Refused' , style:  TextStyle(color: Colors.white),) , color: Colors.redAccent,)),
            ],
          ),
        ),
    );
  }
}
