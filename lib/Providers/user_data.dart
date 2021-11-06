import 'package:e_commerce/Models/User.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier
{
  UserModel? user;
  setUser(UserModel user)
  {
    this.user=user;
  }





}