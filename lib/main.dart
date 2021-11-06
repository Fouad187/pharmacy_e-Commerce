import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Screens/Admin/Admin_home_screen.dart';
import 'package:e_commerce/Screens/Auth/Login_Screen.dart';
import 'package:e_commerce/Screens/Auth/Registartion_Screen.dart';
import 'package:e_commerce/Screens/User/User_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/Modal_hud.dart';

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


          /// Admin
          AdminHomeScreen.id:(context)=>AdminHomeScreen(),
        },
      ),
    );
  }
}
