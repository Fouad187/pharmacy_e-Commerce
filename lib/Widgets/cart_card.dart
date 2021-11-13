import 'package:e_commerce/Models/Product.dart';
import 'package:e_commerce/Providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
class CartCard extends StatelessWidget {
  Product product;
  CartCard({required this.product});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: size.width*0.4,
              height: size.height*0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.fill,
                  )
              ),
            ),
           const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text('${product.price} LE' , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                Text('Q : ${product.quantity}' , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),

                Container(
                    width: size.width*0.45,
                    child: FlatButton(onPressed: (){
                      final instance=Provider.of<Cart>(context , listen: false);
                      instance.deleteFromCart(product: product);
                    }, child: const Text('Remove From Cart' , style:  TextStyle(color: Colors.white),) , color: Kcolor,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
