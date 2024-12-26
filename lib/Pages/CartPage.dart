import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Helper/cart_provider.dart';
import 'package:openfashion/Helper/db_helper.dart';
import 'package:openfashion/Widgets/SideBarMenu.dart';
import 'package:openfashion/Widgets/customappbar.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  DBHelper? dbhelper = DBHelper();
  late Future<List<Cart>> _cartFuture;
  @override
  void initState() {
    _cartFuture = Provider.of<CartProvider>(context, listen: false).getData();
  } // late Future<List<Cart>> _cartFuture=Provider.of<CartProvider>(context, listen: false).getData();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // _cartFuture = Provider.of<CartProvider>(context, listen: false).getData();
  // }



  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context,listen: true);
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: CustomAppBar(titleText: "Open Fashion"),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
            MediaQuery.of(context).size.height, // Full height constraint
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "CART",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<List<Cart>>(
                  future: cart.getData(), // Use the stored Future
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('Loading...');
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      print('No data in cart');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(image: AssetImage('assets/Images/emptycart.png'),),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Your cart is empty',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold, // Change font weight here
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      print('Data fetched: ${snapshot.data}');
                      return ListView.builder(
                        shrinkWrap: true,
                        // To fit within a SingleChildScrollView
                        physics: NeverScrollableScrollPhysics(),
                        // Prevent nested scrolling issues
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            elevation: 4.0, // Add shadow for better appearance
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12.0), // Rounded corners
                            ),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              // Add some internal padding
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Product Image
                                  Image.asset(
                                    item.image ?? 'assets/placeholder.png',
                                    height: 80.0,
                                    width: 80.0,
                                    // Scale image to fit nicely
                                  ),
                                  SizedBox(width: 16.0),
                                  // Space between image and details

                                  // Product Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.productName ?? 'No Product Name',
                                          style: TextStyle(
                                            fontFamily: 'RobotoMedium',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          // Limit to two lines for product name
                                          overflow: TextOverflow
                                              .ellipsis, // Ellipsis for overflow
                                        ),
                                        SizedBox(height: 8.0),
                                        // Space between name and price
                                        Text(
                                          '\$${item.productPrice?.toStringAsFixed(2) ?? '0.00'}',
                                          style: TextStyle(
                                            color: Color(0xFFDD8560),
                                            fontSize: 16.0,
                                            fontFamily: 'RobotoMedium',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Remove from Cart Button
                                  Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove_shopping_cart,
                                            color: Colors.grey),
                                        onPressed: () async {
                                          // dbhelper!
                                          //     .delete(snapshot.data![index].id!);
                                          // cart.removeCounter();
                                          // cart.removeTotalPrice(double.parse(
                                          //     snapshot.data![index].productPrice
                                          //         .toString()));
                                          // setState(() {
                                          //   _cartFuture = cart.getData();
                                          // });
                                          cart.removeFromCart(snapshot.data![index].id!,double.parse(snapshot.data![index].productPrice.toString()));
                                        },
                                      ),
                                      Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap:(){
                                                  int quantity=snapshot.data![index].quantity!;
                                                  int price=snapshot.data![index].initialPrice!;
                                                  quantity--;
                                                  int? newprice=price*quantity;
                                                  if(quantity>0){
                                                    dbhelper!.updateQuantity(
                                                        Cart(
                                                          id: snapshot.data![index].id!,
                                                          productId: snapshot.data![index].productId!.toString(),
                                                          productName: snapshot.data![index].productName!,
                                                          initialPrice: snapshot.data![index].initialPrice!,
                                                          productPrice: newprice,
                                                          quantity: quantity,
                                                          image: snapshot.data![index].image!.toString(),
                                                        )
                                                    ).then((onValue){
                                                      newprice=0;
                                                      quantity=0;
                                                      cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                      cart.notifyListeners();
                                                      // setState(() {
                                                      //   _cartFuture = cart.getData();
                                                      // }); // Trigger UI rebuild
                                                    }).onError((error,stackTrace){
                                                      print("Error occured and this is the message"+error.toString());
                                                    });
                                                  }



                                                },
                                                  child: const Icon(Icons.remove,color: Colors.white,),
                                              ),
                                              Consumer<CartProvider>(
                                                builder: (context, cart, child) {
                                                  return Text(
                                                    snapshot.data![index].quantity.toString(),
                                                    style: const TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'RobotoMedium',),
                                                  );
                                                },
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  int quantity=snapshot.data![index].quantity!;
                                                  print('Past quantity:'+quantity.toString());
                                                  int price=snapshot.data![index].initialPrice!;
                                                  quantity++;
                                                  print('New quantity:'+quantity.toString());

                                                  int? newprice=price*quantity;
                                                  dbhelper!.updateQuantity(
                                                    Cart(
                                                        id: snapshot.data![index].id!,
                                                        productId: snapshot.data![index].productId!.toString(),
                                                        productName: snapshot.data![index].productName!,
                                                        initialPrice: snapshot.data![index].initialPrice!,
                                                        productPrice: newprice,
                                                        quantity: quantity,
                                                        image: snapshot.data![index].image!.toString(),
                                                    )
                                                  ).then((onValue){
                                                      newprice=0;
                                                      quantity=0;
                                                      cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                      cart.notifyListeners();
                                                      // setState(() {
                                                      //   _cartFuture = cart.getData();
                                                      // }); // Trigger UI rebuild
                                                  }).onError((error,stackTrace){
                                                    print("Error occured and this is the message"+error.toString());
                                                  });
                                                },
                                                  child: const Icon(Icons.add,color: Colors.white,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),

                // Consumer<CartProvider>(
                //   builder: (context, cartProvider, child) {
                //     return FutureBuilder<List<Cart>>(
                //       future: cartProvider.getData(), // Fetch data from CartProvider
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState == ConnectionState.waiting) {
                //           return const Center(child: CircularProgressIndicator()); // Show loading indicator while fetching
                //         } else if (snapshot.hasError) {
                //           return Center(child: Text('Error: ${snapshot.error}')); // Show error message
                //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //           return const Center(child: Text('No items in the cart')); // Show message if no items
                //         } else {
                //           // List of cart items
                //           List<Cart> cartItems = snapshot.data!;
                //           return ListView.builder(
                //             itemCount: cartItems.length,
                //             itemBuilder: (context, index) {
                //               return ListTile(
                //                 title: Text(cartItems[index].productName ?? 'Unknown Product'),
                //                 subtitle: Text('Quantity: ${cartItems[index].quantity}'),
                //                 trailing: Text('Price: ${cartItems[index].productPrice}'),
                //               );
                //             },
                //           );
                //         }
                //       },
                //     );
                //   },
                // ),


                Consumer<CartProvider>(builder: (context, value, child) {
                  return Visibility(
                    visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                        ? false
                        : true,
                    child: Column(
                      children: [
                        ReusableWidget(
                          title: 'Sub Total',
                          value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                        ),
                        ReusableWidget(
                          title: 'Discount 5%',
                          value: r'$' + (0.05*value.getTotalPrice()).toStringAsFixed(2),
                        ),
                        ReusableWidget(
                          title: 'Total Price',
                          value: r'$' + (0.95*value.getTotalPrice()).toStringAsFixed(2),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold, // Change font weight here
              ),
            ),
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold, // Change font weight here
              ),
            ),
          ],
        ),
      ),
    );
  }
}