import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Providers/admin_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class MyProductWidget extends StatelessWidget {
  Product product;
  int index;
  String name;
  MyProductWidget({required this.product , required this.index , required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 2,
        child: Container(
          padding:  const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,  style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                    Text(product.brand, style: const TextStyle(color: Colors.grey),),
                    const SizedBox(height: 10,),

                    Text('${product.price} LE ', style: const TextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: () async{
                    if(name=='Medicine')
                      {
                        await FirebaseFirestore.instance.collection(
                            'Medicines').doc(product.docId).delete();
                        Provider.of<AdminData>(context,listen: false).removeFromMedicine(index : index);
                      }
                    else if (name=='Equipment')
                      {
                        await FirebaseFirestore.instance.collection(
                            'Equipments').doc(product.docId).delete();
                        Provider.of<AdminData>(context,listen: false).removeFromEquipment(index : index);
                      }
                    else
                      {
                        await FirebaseFirestore.instance.collection(
                            'Supplies').doc(product.docId).delete();
                        Provider.of<AdminData>(context,listen: false).removeFromSupplies(index : index);
                      }

                  },
                  child: Icon(Icons.delete , color: Kcolor,)),

            ],
          ),
        ),
      ),
    );

  }
}
