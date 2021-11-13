import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Widgets/admin_order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class AdminHomeTap extends StatefulWidget {
  @override
  State<AdminHomeTap> createState() => _AdminHomeTapState();
}

class _AdminHomeTapState extends State<AdminHomeTap> {
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
    Provider.of<AdminData>(context,listen: false).getAdminOrders();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(child: Text('Orders Board' , style: TextStyle(fontSize: 18),)),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AdminOrderCard(order: Provider.of<AdminData>(context).orders[index] , index: index,);
                },
                itemCount:Provider.of<AdminData>(context).orders.length,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
