import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/Equipment.dart';
import 'package:e_commerce/Models/Medicine.dart';
import 'package:e_commerce/Models/User.dart';
import 'package:e_commerce/Providers/admin_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class AdminServices

{


  void addNewEquipment({required String name, required String description ,required String price, required File image,required String brand ,required String weight, context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Equipment_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    EquipmentAndSupplies equipment=EquipmentAndSupplies(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      brand: brand,
      weight: weight,
    );


    await FirebaseFirestore.instance.collection('Equipments').doc().set(equipment.toJson());

  }
  void addNewSupplies({required String name, required String description ,required String price, required File image,required String brand ,required String weight, context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Supplies_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    EquipmentAndSupplies equipment=EquipmentAndSupplies(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      brand: brand,
      weight: weight,
    );


    await FirebaseFirestore.instance.collection('Supplies').doc().set(equipment.toJson());

  }
  void addNewMedicine({required String name, required String price,required String description ,required String type, required String companyName, required File image , context}) async
  {
    UserModel? user=Provider.of<AdminData>(context , listen: false).user;

    final ref=FirebaseStorage.instance.ref().child('Medicine_photo').child('${getRandomId()}.jpg');
    await ref.putFile(image);
    final url=await ref.getDownloadURL();


    Medicine medicine=Medicine(
      id: user!.id,
      name: name,
      description: description,
      image: url,
      price: price,
      type: type,
      companyName: companyName,
    );


    await FirebaseFirestore.instance.collection('Medicines').doc().set(medicine.toJson());

  }
  Future<List<EquipmentAndSupplies>> getEquipment() async
  {
    List<EquipmentAndSupplies> equipment=[];
    await FirebaseFirestore.instance.collection('Equipments').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {

        equipment.add(EquipmentAndSupplies.fromJson(value.docs[i].data()));
        equipment[i].docId=value.docs[i].id;
      }

    });


    return equipment;
  }
  Future<List<EquipmentAndSupplies>> getSupplies() async
  {
    List<EquipmentAndSupplies> supplies=[];
    await FirebaseFirestore.instance.collection('Supplies').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {

        supplies.add(EquipmentAndSupplies.fromJson(value.docs[i].data()));
        supplies[i].docId=value.docs[i].id;
      }

    });


    return supplies;
  }
  Future<List<Medicine>> getMedicine() async
  {
    List<Medicine> medicine=[];
    await FirebaseFirestore.instance.collection('Medicines').get().then((value) {
      for(int i = 0; i < value.docs.length; i++)
      {

        medicine.add(Medicine.fromJson(value.docs[i].data()));
        medicine[i].docId=value.docs[i].id;
      }

    });


    return medicine;
  }







}