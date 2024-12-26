import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Helper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{

  final DBHelper db = DBHelper();
  int _counter=0;
  int get counter=>_counter;

  double _totalPrice=0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;




  Future<void> addToCart(BuildContext context, Cart cartItem) async {
    try {
      await db.insert(Cart(
        id: cartItem.id, // Unique ID
        productId: cartItem.productId, // Unique ID
        productName: cartItem.productName,
        initialPrice: cartItem.initialPrice,
        productPrice: cartItem.productPrice,
        quantity: cartItem.quantity,
        image: cartItem.image,
      ));
      // Update state in the provider
      addTotalPrice(double.parse(cartItem.productPrice.toString()));
      addCounter();
      print('Product is added to cart');
    } catch (error) {
      print('Error adding product to cart: $error');
    }
  }


  Future<List<Cart>> getData() async {
    try{

      List<Cart> cartList= await db.getCartList();
      _cart = Future.value(cartList); // Await to get the actual data
      print('Fetched ${cartList.length} items from cart');
      // Log details of each item in the cart
      for (var cart in cartList) {
        print('Cart Item:');
        print('  ID: ${cart.id}');
        print('  Product ID: ${cart.productId}');
        print('  Product Name: ${cart.productName}');
        print('  Initial Price: ${cart.initialPrice}');
        print('  Product Price: ${cart.productPrice}');
        print('  Quantity: ${cart.quantity}');
        print('  Image: ${cart.image}');
      }
      notifyListeners();
      return _cart; // Return the fetched data
    }
    catch(error){
      print("Dhairrrrrrrrrrrrrrrrrrrrrrrrryyyyyyyyyyyyyyyyyaaaaaaaaaa error: $error");
      return[];
    }
  }

  void _setPreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cart_item', _counter);
    pref.setDouble('total_price', _totalPrice);
  notifyListeners();
  }


  void _getPreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter=pref.getInt('cart_item')??0;
    _totalPrice=pref.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }
  void addCounter(){
    _counter++;
    _setPreferences();
    notifyListeners();
  }
  void removeCounter(){
    _counter--;
    _setPreferences();
    notifyListeners();
  }
  int getCounter(){
    _getPreferences();
    return _counter;
  }

  void addTotalPrice(double productPrice){
    _totalPrice+=productPrice;
    _setPreferences();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalPrice-=productPrice;
    _setPreferences();
    notifyListeners();
  }
  double getTotalPrice(){
    _getPreferences();
    return _totalPrice;
  }

  // New method to remove a product from the cart
  Future<void> removeFromCart(int id, double productPrice) async {
    try {
      await db.delete(id); // Delete the item from the database
      removeTotalPrice(productPrice); // Update the total price
      removeCounter(); // Decrease the counter
      await getData(); // Refresh the cart data
      print('Product removed from cart');
    } catch (error) {
      print('Error removing product from cart: $error');
    }
  }
}