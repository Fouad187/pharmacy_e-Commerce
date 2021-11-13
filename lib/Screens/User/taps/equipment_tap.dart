import 'package:e_commerce/Providers/user_data.dart';
import 'package:e_commerce/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EquipmentTap extends StatefulWidget {
  @override
  State<EquipmentTap> createState() => _EquipmentTapState();
}

class _EquipmentTapState extends State<EquipmentTap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getEquipment();
    });
  }
  getEquipment()
  {
    Provider.of<UserData>(context,listen: false).getEquipments();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10 , right: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 5 ,
          childAspectRatio: 0.9,
        ),
        itemCount: Provider.of<UserData>(context).equipments.length,
        itemBuilder: (context, index) {
          return ProductCard(product: Provider.of<UserData>(context).equipments[index],);
        },
      ),
    );

  }
}
