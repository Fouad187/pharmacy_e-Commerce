import 'package:e_commerce/Providers/user_data.dart';
import 'package:e_commerce/Widgets/user_order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class OrdersTap extends StatefulWidget {
  @override
  State<OrdersTap> createState() => _OrdersTapState();
}

class _OrdersTapState extends State<OrdersTap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getOrders();
    });
  }
  getOrders()
  {
    Provider.of<UserData>(context,listen: false).getOrders();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
        centerTitle: true,
        backgroundColor: Kcolor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return UserOrderCard(order: Provider.of<UserData>(context).orders[index]);
        },
        itemCount: Provider.of<UserData>(context).orders.length,
      ),
    );
  }
}