import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Widgets/my_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class AdminAllSuppliesScreen extends StatelessWidget {
  static String id='AdminAllSuppliesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: const Text('Medicines'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MyProductWidget(product: Provider.of<AdminData>(context).supplies[index] , index: index,name: 'Supplies',);
        },
        itemCount: Provider.of<AdminData>(context).supplies.length,
      ),
    );

  }
}
