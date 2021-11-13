import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Widgets/my_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class AdminAllMedicineScreen extends StatelessWidget {
  static String id='AdminAllMedicineScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: const Text('Medicines'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MyProductWidget(product: Provider.of<AdminData>(context).medicines[index] , index: index,name: 'Medicine',);
        },
        itemCount: Provider.of<AdminData>(context).medicines.length,
      ),
    );

  }
}
