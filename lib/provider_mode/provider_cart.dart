



import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  List<CartItem> items = [];
  Cart() {}
 int get count {
    return items.length+1;
  }

  void addItem(CartItem item) {
    bool stat=false;
    for(int i=0;i<items.length;i++){
      if(items[i].productId==item.productId){
        stat=true;
        break;
      }
    }
    if(stat==false){
 items.add(item);
    }
    
     notifyListeners();
  }

  void removeItem(CartItem item) {
    items.remove(item);
     notifyListeners();
  }

   updateQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
     notifyListeners();
  }

  double get totalPrice {
    double totalPrice = 0.0;
    for (CartItem item in items) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}


class CartItem {
  int productId;
  String name;
  String description;
  double price;
  int quantity=0;
  String imageUrl;
 increquantity(val){
  this.quantity+val;
}
 decrequantity(val){
  this.quantity-val;
}
  CartItem({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}