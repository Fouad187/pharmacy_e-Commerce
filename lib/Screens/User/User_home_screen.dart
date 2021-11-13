import 'package:e_commerce/Providers/navigation.dart';
import 'package:e_commerce/Screens/User/taps/cart_tap.dart';
import 'package:e_commerce/Screens/User/taps/orders_tap.dart';
import 'package:e_commerce/Screens/User/taps/products_tap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
class UserHomeScreen extends StatelessWidget {
  static String id='UserHomeScreenID';

  final taps=[
    ProductsTap(),
    CartTap(),
    OrdersTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Kcolor,
        currentIndex: Provider.of<BottomNavigation>(context).selectedIndex,
        onTap: (index){
          Provider.of<BottomNavigation>(context,listen:false).navigate(index: index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
        ],
      ),
      body: taps[Provider.of<BottomNavigation>(context).selectedIndex],
    );
  }
}
