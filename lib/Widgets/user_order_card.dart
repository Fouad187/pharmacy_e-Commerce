import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Widgets/product_card.dart';
import 'package:flutter/material.dart';

class UserOrderCard extends StatelessWidget {
  Order order;
  UserOrderCard({required this.order});
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
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: order.status=='In Review' ? Colors.yellow : order.status=='Accepted' ? Colors.green : Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child : order.status=='In Review' ? Text('In Review') : order.status=='Accepted' ?
                Text('Accepted',style: TextStyle(color: Colors.white),) : Text('Rejected',style: TextStyle(color: Colors.white)),),
              ),

            ],
          ),
        ),
    );
  }
}
