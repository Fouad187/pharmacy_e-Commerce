import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String image;
  final String name;
  PaymentCard({required this.image,required this.name});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: size.height*0.1,
        width: size.width*0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          )
        ),
      ),
    );
  }
}
