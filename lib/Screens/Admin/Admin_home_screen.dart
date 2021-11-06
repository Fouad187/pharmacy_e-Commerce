import 'package:e_commerce/Screens/Admin/taps/add_equipment_tap.dart';
import 'package:e_commerce/Screens/Admin/taps/add_medicine_tap.dart';
import 'package:e_commerce/Screens/Admin/taps/add_supplies_tap.dart';
import 'package:e_commerce/Screens/Admin/taps/admin_home_tap.dart';
import 'package:e_commerce/Screens/Auth/Login_Screen.dart';
import 'package:e_commerce/Services/Auth_Services.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class AdminHomeScreen extends StatefulWidget {
  static String id='AdminHomeScreenID';

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex=0;

  final taps=[
    AdminHomeTap(),
    AddMedicineTap(),
    AddEquipmentTap(),
    AddSuppliesTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: Text('Admin Panel'),
      ),
      drawer: Drawer(
        child: Scaffold(
          body: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Kcolor,
                ),
                child: Column(
                  children: [
                   Expanded(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/adminlogo2.png'),
                              fit: BoxFit.contain,
                            )
                        ),
                      ),
                    ),
                    Center(child: Text('Admin', style:const TextStyle( fontSize: 25 , fontWeight: FontWeight.bold ,color: Colors.white),)),
                  ],
                ),
              ),
              ListTile(
                title: const Text('My Medicines', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.medical_services, color: Kcolor),
                onTap: (){
                /*  Provider.of<UserData>(context,listen: false).getMyEggs(farmId: user.id).then((value) {
                    Navigator.pushNamed(context, MyEggScreen.id);
                  });

                 */
                },

              ),
              ListTile(
                title: const Text('My Equipments', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.accessible_forward_sharp, color: Kcolor),
                onTap: (){
                 /* Provider.of<UserData>(context,listen: false).getMyChickens(farmId: user.id).then((value) {
                    Navigator.pushNamed(context, MyChickensScreen.id);
                  });
                  */
                },
              ),
              ListTile(
                title: const Text('My Supplies', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.widgets, color: Kcolor),
                onTap: (){
                 /* Provider.of<UserData>(context,listen: false).getMyLittleChickens(farmId: user.id).then((value) {
                    Navigator.pushNamed(context, MyLittleChickenScreen.id);
                  });

                  */
                },
              ),
              ListTile(
                title: const Text('All Orders', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.reorder, color: Kcolor),
                onTap: (){
                 // Navigator.pushNamed(context,AllOrderScreen.id);
                },
              ),
              ListTile(
                title: const Text('Log out', style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.logout, color: Kcolor),
                onTap: () async {
                  Auth auth=Auth();
                  auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Kcolor,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Add Medicine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible_forward_sharp),
            label: 'Add Equipment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Add Supplies ',
          ),
        ],
      ),
      body: taps[selectedIndex],
    );
  }
}
