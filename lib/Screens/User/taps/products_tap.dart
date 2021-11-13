import 'package:e_commerce/Providers/cart.dart';
import 'package:e_commerce/Providers/navigation.dart';
import 'package:e_commerce/Screens/Auth/Login_Screen.dart';
import 'package:e_commerce/Screens/User/taps/equipment_tap.dart';
import 'package:e_commerce/Screens/User/taps/medicine_tap.dart';
import 'package:e_commerce/Screens/User/taps/supplies_tap.dart';
import 'package:e_commerce/Services/Auth_Services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class ProductsTap extends StatefulWidget {
  @override
  State<ProductsTap> createState() => _ProductsTapState();
}

class _ProductsTapState extends State<ProductsTap> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Kcolor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Categories' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Provider.of<BottomNavigation>(context,listen: false).navigate(index: 1);
                          },
                          child: Stack(
                            children: [
                              const Icon(Icons.shopping_cart ,size: 30, color: Colors.white,),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.5),
                                    color: Colors.green,
                                  ),
                                  child: Center(child: Text('${Provider.of<Cart>(context).products.length}', style: const TextStyle(color: Colors.white),)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        InkWell(
                          onTap: () async {
                            Auth auth=Auth();
                            auth.signOut();
                            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                          },
                            child: Icon(Icons.exit_to_app, color: Colors.white,size: 30,)),
                      ],
                    ),
                ],),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20 , right: 20 ,bottom: 20),
                child: Material(
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(15),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search , color: Colors.black,),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.transparent,
                      labelColor: Kcolor,
                      unselectedLabelColor: Color(0xFFCDCDCD),
                      tabs: [
                        Tab(icon: Icon(Icons.medical_services) , child: Text('Medicine'),),
                        Tab(icon: Icon(Icons.accessible_forward_sharp) , child: Text('Equipment'),),
                        Tab(icon: Icon(Icons.widgets) , child: Text('Supplies'),),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          MedicineTap(),
                          EquipmentTap(),
                          SuppliesTap(),
                        ],
                      ),
                    )
                  ],
                )
              )),
            ],
          ),
        ),
      ),
    );
  }
}