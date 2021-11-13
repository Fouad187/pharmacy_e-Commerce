import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Widgets/my_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class AdminAllEquipmentScreen extends StatelessWidget {
  static String id='AdminAllEquipmentScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: const Text('Equipments'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MyProductWidget(product: Provider.of<AdminData>(context).equipments[index] , index: index,name: 'Equipment',);
        },
        itemCount: Provider.of<AdminData>(context).equipments.length,
      ),
    );

  }
}
