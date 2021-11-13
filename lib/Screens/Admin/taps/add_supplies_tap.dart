import 'dart:io';

import 'package:e_commerce/Providers/Modal_hud.dart';
import 'package:e_commerce/Services/Admin_Services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../Admin_home_screen.dart';


class AddSuppliesTap extends StatefulWidget {
  @override
  State<AddSuppliesTap> createState() => _AddSuppliesTapState();
}

class _AddSuppliesTapState extends State<AddSuppliesTap> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? name ,description,price,brand,type;
  AdminServices adminServices=AdminServices();
  File? _pickedimage;
  final ImagePicker _picker=ImagePicker();
  void _pickimage(ImageSource src) async
  {
    final pickedimagefile= await _picker.getImage(source: src);
    if(pickedimagefile != null)
    {
      setState(() {
        _pickedimage=File(pickedimagefile.path);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isChange,
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            const Center(child: Text('Add New Supplies' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),)),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                _pickimage(ImageSource.gallery);
              },
              child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,

                    ),
                    child: _pickedimage==null ? const Icon(Icons.add_a_photo) : Image.file(_pickedimage! , fit: BoxFit.fill,),
                  )),
            ),
            const SizedBox(height: 10,),
            const Center(child: Text('Supplies Image')),
            const SizedBox(height: 10,),
            Form(
              key: _globalKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20 , right: 20 , bottom: 5),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Supplies Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15) ,),
                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return  'Please Enter Supplies name';
                        }
                      },
                      onChanged: (value)
                      {
                        setState(() {
                          name=value;
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Supplies Description',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15) ,),

                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return  'Please Enter Supplies Description';
                        }
                      },
                      onChanged: (value)
                      {
                        setState(() {
                          description=value;
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Supplies Price',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15) ,),

                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return  'Please Enter Supplies Price';
                        }
                      },
                      onChanged: (value)
                      {
                        setState(() {
                          price=value;
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Supplies Brand',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15) ,),

                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return  'Please Enter Supplies Brand';
                        }
                      },
                      onChanged: (value)
                      {
                        setState(() {
                          brand=value;
                        });
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Supplies Type',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15) ,),

                      ),
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return  'Please Enter Supplies Type';
                        }
                      },
                      onChanged: (value)
                      {
                        setState(() {
                          type=value;
                        });
                      },
                    ),
                    const SizedBox(height: 15,),

                    Container(
                      width: double.infinity,
                      child: FlatButton(onPressed: () async {
                        final instance =
                        Provider.of<ModalHud>(context, listen: false);
                        instance.changeIsLoading(true);
                        if(_globalKey.currentState!.validate())
                        {
                          _globalKey.currentState!.save();
                          try{
                            if(_pickedimage == null )
                            {
                              instance.changeIsLoading(false);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Select Image')));

                            }
                            else {
                              adminServices.addNewSupplies(
                                image: _pickedimage!,
                                description: description!,
                                name: name!,
                                price: price!,
                                brand: brand!,
                                type: type!,
                                context: context,
                              );
                              Navigator.pushReplacementNamed(context, AdminHomeScreen.id);
                              instance.changeIsLoading(false);
                            }
                          } catch (e){
                            instance.changeIsLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

                          }
                        }
                        instance.changeIsLoading(false);
                      },
                        color: Kcolor,
                        child: const Text('Add Supplies' , style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}
