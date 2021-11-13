import 'package:e_commerce/Providers/cart.dart';
import 'package:e_commerce/Screens/User/payment_screen.dart';
import 'package:e_commerce/Widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class CartScreen extends StatelessWidget {
  static String id='CartScreenId';
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);

    double totalPrice=cart.calculatePrice();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Kcolor,
        centerTitle: true,
      ),
      body: cart.products.length >= 1 ? Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                return CartCard(product: cart.products[index],);
              },
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(onPressed: ()  {

                Navigator.pushNamed(context, PaymentScreen.id);
              }, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Confirm' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                  Text(' Total : ${cart.calculatePrice().toString()} LE' , style: const TextStyle(color: Colors.white),),
                ],
              ) , color: Colors.green,)),
        ],
      ) : Column(
        children: const [
          Expanded(child: Image(image: AssetImage('assets/images/empty.png'),)),
        ],
      ),
    );
  }
}
