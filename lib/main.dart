import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Providers/cart.dart';
import 'package:e_commerce/Providers/navigation.dart';
import 'package:e_commerce/Providers/user_data.dart';
import 'package:e_commerce/Screens/Admin/Admin_home_screen.dart';
import 'package:e_commerce/Screens/Admin/admin_all_medicine.dart';
import 'package:e_commerce/Screens/Admin/admin_all_orders.dart';
import 'package:e_commerce/Screens/Admin/admin_all_supplies.dart';
import 'package:e_commerce/Screens/Auth/Login_Screen.dart';
import 'package:e_commerce/Screens/Auth/Registartion_Screen.dart';
import 'package:e_commerce/Screens/User/User_home_screen.dart';
import 'package:e_commerce/Screens/User/taps/cart_tap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/Modal_hud.dart';
import 'Screens/Admin/admin_all_equipment.dart';
import 'Screens/User/payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(create: (context) => ModalHud(),),
        ChangeNotifierProvider<AdminData>(create: (context) => AdminData(),),
        ChangeNotifierProvider<UserData>(create: (context) => UserData(),),
        ChangeNotifierProvider<Cart>(create: (context) => Cart(),),
        ChangeNotifierProvider<BottomNavigation>(create: (context) => BottomNavigation(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          /// Auth
          LoginScreen.id : (context)=> LoginScreen(),
          RegistrationScreen.id : (context)=> RegistrationScreen(),

          /// User
          UserHomeScreen.id:(context)=>UserHomeScreen(),
          CartTap.id:(context)=>CartTap(),
          PaymentScreen.id:(context)=>PaymentScreen(),

          /// Admin
          AdminHomeScreen.id:(context)=>AdminHomeScreen(),
          AdminAllEquipmentScreen.id:(context)=>AdminAllEquipmentScreen(),
          AdminAllMedicineScreen.id:(context)=>AdminAllMedicineScreen(),
          AdminAllSuppliesScreen.id:(context)=>AdminAllSuppliesScreen(),
          AdminAllOrdersScreen.id:(context)=>AdminAllOrdersScreen(),
        },
      ),
    );
  }
}
