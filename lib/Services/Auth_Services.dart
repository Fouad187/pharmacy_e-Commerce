
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:e_commerce/Providers/Modal_hud.dart';
import 'package:e_commerce/Providers/admin_data.dart';
import 'package:e_commerce/Providers/user_data.dart';
import 'package:e_commerce/Screens/Admin/Admin_home_screen.dart';
import 'package:e_commerce/Screens/User/User_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth
{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _userCollection=FirebaseFirestore.instance.collection('Users');

  Future<void> signIn({required String email , required String password ,required context}) async
  {
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      _userCollection.doc(value.user?.uid).get().then((value2) {
        var type = (value2)['type'];
        UserModel userModel=UserModel(
          email: (value2)['email'],
          id: value.user!.uid,
          name: (value2)['name'],
          type: (value2)['type'],
        );
        final instance = Provider.of<ModalHud>(context, listen: false);
        if(type=='User')
        {
          Navigator.pushReplacementNamed(context, UserHomeScreen.id);
          instance.changeIsLoading(false);
        }
        else if (type=='Admin')
        {
          Provider.of<AdminData>(context , listen: false).setUser(userModel);
          Navigator.pushReplacementNamed(context, AdminHomeScreen.id);
          instance.changeIsLoading(false);
        }
      });
    });
  }
  Future<void> createAccount({required String name, required String email ,required String password,context}) async
  {

    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
      UserModel usermodel=UserModel(
        id: user.user!.uid,
        name: name,
        email: email,
        type: 'User',
      );
      await Adduserdata(usermodel);
      Provider.of<UserData>(context , listen: false).setUser(usermodel);
    });

  }
  Future<void> Adduserdata(UserModel userModel) async
  {
    return await _userCollection.doc(userModel.id).set(userModel.toJson());
  }
  void signOut() async
  {
    await _auth.signOut();
  }


}