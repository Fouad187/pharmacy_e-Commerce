import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Providers/cart.dart';
import 'package:e_commerce/Providers/navigation.dart';
import 'package:e_commerce/Screens/User/taps/cart_tap.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class ProductDescription extends StatefulWidget {
  Product product;
  ProductDescription({required this.product});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int count=1;
  add()
  {
    setState(() {
      count++;
    });
  }
  min()
  {
    if(count >= 2)
    {
      setState(() {
        count--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: Text(widget.product.name),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10 , top: 10),
            child: InkWell(
              onTap: (){
                  Navigator.pushNamed(context, CartTap.id);
              },
              child: Stack(
                children: [
                  const Icon(Icons.shopping_cart ,size: 30,),
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
                      child: Center(child: Text('${Provider.of<Cart>(context).products.length}' , style: const TextStyle(color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            ),

          ),
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: widget.product.image,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.product.image), fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.product.description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Company (Brand) : ${widget.product.brand}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Type :${widget.product.type}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('  ${widget.product.price}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Quantity',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  min();
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black),
                                  child: const Center(
                                      child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )),
                                ),
                              ),
                              Text('$count',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () {
                                  add();
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Kcolor,
                                  ),
                                  child: const Center(
                                      child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: (){
                        final instance=Provider.of<Cart>(context , listen: false);
                        widget.product.quantity=count;
                        widget.product.totalPrice=count*(double.parse(widget.product.price));
                        instance.addToCart(product: widget.product);
                        Fluttertoast.showToast(msg: 'item added successfully');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Add To Cart' , style: TextStyle(color: Colors.white),),
                      color: Kcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
