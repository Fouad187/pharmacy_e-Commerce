import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:e_commerce/Models/order_model.dart';
import 'package:e_commerce/Providers/admin_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class AdminServices

{


  void addNewEquipment({required String name, required String description ,required String price, required File image,required String brand ,required String type, context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Equipment_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    Product equipment=Product(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      brand: brand,
      type: type,
    );


    await FirebaseFirestore.instance.collection('Equipments').doc().set(equipment.toJson());

  }
  void addNewSupplies({required String name, required String description ,required String price, required File image,required String brand ,required String type, context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Supplies_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    Product equipment=Product(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      brand: brand,
      type: type,
    );


    await FirebaseFirestore.instance.collection('Supplies').doc().set(equipment.toJson());

  }
  void addNewMedicine({required String name, required String price,required String description ,required String type, required String companyName, required File image , context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Medicine_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    Product medicine=Product(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      type: type,
      brand: companyName,
    );


    await FirebaseFirestore.instance.collection('Medicines').doc().set(medicine.toJson());

  }
  static Future<List<Product>> getEquipment() async
  {
    List<Product> equipment=[];
    await FirebaseFirestore.instance.collection('Equipments').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {

        equipment.add(Product.fromJson(value.docs[i].data()));
        equipment[i].docId=value.docs[i].id;
      }

    });


    return equipment;
  }
  static Future<List<Product>> getSupplies() async
  {
    List<Product> supplies=[];
    await FirebaseFirestore.instance.collection('Supplies').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {

        supplies.add(Product.fromJson(value.docs[i].data()));
        supplies[i].docId=value.docs[i].id;
      }

    });

    return supplies;
  }
  static Future<List<Product>> getMedicine() async
  {
    List<Product> medicine=[];
    await FirebaseFirestore.instance.collection('Medicines').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {
        medicine.add(Product.fromJson(value.docs[i].data()));
        medicine[i].docId=value.docs[i].id;
      }

    });


    return medicine;
  }

  static Future<List<Order>> getOrders() async 
  {
    List<Order> orders=[];
    await FirebaseFirestore.instance.collection('Orders').where('status' , isEqualTo: 'In Review').get().then((value) {
      for(int i=0 ; i<value.docs.length ; i++)
      {
        orders.add(Order.fromJson(value.docs[i].data()));
        orders[i].docId=value.docs[i].id;
      }
    });
    return orders;
  }



  static Future<List<Order>> getAllOrders() async
  {
    List<Order> orders=[];
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      for(int i=0 ; i<value.docs.length ; i++)
      {
        orders.add(Order.fromJson(value.docs[i].data()));
        orders[i].docId=value.docs[i].id;
      }
    });
    return orders;
  }

}