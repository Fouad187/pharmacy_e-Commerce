import 'package:e_commerce/Models/Product.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {

  List<Product> products=[];

  addToCart({required Product product})
  {
    products.add(product);
    notifyListeners();
  }

  deleteFromCart({required Product product})
  {
    products.remove(product);
    notifyListeners();
  }

  double calculatePrice()
  {
    double sum=0;
    for(var product in products)
      {
        sum+=product.totalPrice!;
      }
    return sum;
  }
  void clear()
  {
    products.clear();
    notifyListeners();
  }
}