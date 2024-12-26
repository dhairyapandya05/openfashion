import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Helper/cart_provider.dart';
import 'package:openfashion/Helper/db_helper.dart';
import 'package:openfashion/Pages/CartPage.dart';
import 'package:openfashion/Widgets/CatelogItem.dart';
import 'package:openfashion/Widgets/Footer.dart';
import 'package:openfashion/Widgets/SideBarMenu.dart';
import 'package:openfashion/Widgets/customappbar.dart';
import 'package:openfashion/Widgets/uiHelper.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

String selectedSize = "M";
final Map<Color, List<String>> colorToImages = {
  Colors.black: ['assets/Images/productdetails/mainproduct.png'],
  Color(0xFFDD8560): ['assets/Images/catalog1.png'],
  Colors.grey: ['assets/Images/catalog2.png'],
};

class Productdetailpage extends StatefulWidget {
  final Cart cart;
  const Productdetailpage({super.key, required this.cart});

  @override
  State<Productdetailpage> createState() => _ProductdetailpageState();
}

class _ProductdetailpageState extends State<Productdetailpage> {
  DBHelper? dbhelper = DBHelper();

  bool isImageInserted = false; // Flag to track if the image is inserted
  final PageController _pageController = PageController();
  final List<Color> availableColors = [
    Colors.black,
    Color(0xFFDD8560),
    Colors.grey
  ];
  List<String> productImages = [
    'assets/Images/productdetails/mainproduct.png',
    'assets/Images/bannner.png', // Default image
    'assets/Images/productdetails/mainproduct.png',
  ];

  final List<Widget> carepolicies=[
    Text(
      'Free Flat Rate Shipping',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    ),
    Text('COD Policy',style: TextStyle(color: Colors.black),),
    Text('Return Policy',style: TextStyle(color: Colors.black),),
  ];
  final List<String> availableSizes = ["S", "M", "L", "XL", "XXL"];
  final List<String> iconpaths=["assets/icons/shipping.png","assets/icons/tag.png","assets/icons/Refresh.png"];
  Color? selectedColor;

  final List<Cart> dummyCartData = [
    Cart(
      id: 1,
      productId: 'P001',
      productName: 'Classic Shirt',
      initialPrice: 1500,
      productPrice: 1200,
      quantity: 1,
      image: 'assets/Images/newarrival_home/posterone.png',
    ),
    Cart(
      id: 2,
      productId: 'P002',
      productName: 'Summer Dress',
      initialPrice: 2000,
      productPrice: 1800,
      quantity: 1,
      image: 'assets/Images/newarrival_home/postertwo.png',
    ),
    Cart(
      id: 3,
      productId: 'P003',
      productName: 'Leather Wallet',
      initialPrice: 1000,
      productPrice: 900,
      quantity: 1,
      image: 'assets/Images/newarrival_home/posterthree.png',
    ),
    Cart(
      id: 4,
      productId: 'P004',
      productName: 'Elegant Watch',
      initialPrice: 3000,
      productPrice: 2700,
      quantity: 1,
      image: 'assets/Images/newarrival_home/posterfour.png',
    )
  ];

  final List<String> expandabletilecontent=[
    'Estimated to be delivered on\n09/11/2021 - 12/11/2021.',
    'Click here to know more about cash on Delivery',
    'Items will only be returnalbe within 7 days of delivery',
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItem = widget.cart; // Accessing the passed Cart item

    if (!isImageInserted && cartItem.image != null) {
      setState(() {
        productImages.insert(0, cartItem.image!);
        isImageInserted = true; // Mark it as inserted
      });
    }

    return Scaffold(
      drawer: SideBarMenu(),
      appBar: CustomAppBar(titleText: "Open Fashion"),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height, // Full height constraint
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: productImages.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            productImages[index],
                            fit: BoxFit.cover,
                          );
                        }),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: productImages.length,
                  effect: const WormEffect(
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: Color(0xFF555555),
                    dotColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              // Product details section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartItem.productName??'',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          const Icon(
                            Icons.ios_share,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Recycle Boucle Knit Cardigan Pink",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[600],fontFamily: 'RobotoMedium',),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '\$${cartItem.productPrice.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xFFDD8560)),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Color",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16.0,fontFamily: 'RobotoMedium',),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: availableColors.map((color) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color;
                                        productImages =
                                            colorToImages[color] ?? [];
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: color,
                                        border: Border.all(
                                          color: selectedColor == color
                                              ? (selectedColor == Colors.black
                                                  ? Colors.grey
                                                  : Color(0xFF333333))
                                              : Colors.transparent,
                                          width: 2.5,
                                        ),
                                      ),
                                      width: 20,
                                      height: 20,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16.0,fontFamily: 'RobotoMedium',),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  _buildSizeCircle("S", setState),
                                  SizedBox(width: 16.0),
                                  // Spacing between circles
                                  _buildSizeCircle("M", setState),
                                  SizedBox(width: 16.0),
                                  _buildSizeCircle("L", setState),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        // dbhelper!.insert(
                        //   Cart(
                        //     id: cartItem.id, // Unique ID
                        //     productId: cartItem.productId, // Unique ID
                        //     productName: cartItem.productName,
                        //     initialPrice: cartItem.initialPrice,
                        //     productPrice: cartItem.productPrice,
                        //     quantity: cartItem.quantity,
                        //     image: cartItem.image,
                        //   )
                        // ).then((value){
                        //   print('Product is added to cart');
                        //   cart.addTotalPrice(double.parse(cartItem.productPrice.toString()));
                        //   cart.addCounter();
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const Cartpage(),
                        //       settings: RouteSettings(name: '/cart'),
                        //     ),
                        //   );
                        // }).onError((error,stackTrace){
                        //   print(error.toString());
                        // });
                        final cartProvider = Provider.of<CartProvider>(context, listen: false);

                        cartProvider.addToCart(
                          context,
                          Cart(
                            id: cartItem.id,
                            productId: cartItem.productId,
                            productName: cartItem.productName,
                            initialPrice: cartItem.initialPrice,
                            productPrice: cartItem.productPrice,
                            quantity: cartItem.quantity,
                            image: cartItem.image,
                          ),
                        ).then((_){
                          print('Product is added to the cart sucessfully');


                          print('Cart Item that is added _______________:');
                          print('  ID: ${cartItem.id}');
                          print('  Product ID: ${cartItem.productId}');
                          print('  Product Name: ${cartItem.productName}');
                          print('  Initial Price: ${cartItem.initialPrice}');
                          print('  Product Price: ${cartItem.productPrice}');
                          print('  Quantity: ${cartItem.quantity}');
                          print('  Image: ${cartItem.image}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cartpage(),
                              settings: RouteSettings(name: '/cart'),
                            ),
                          );

                        }).onError((error,stackTrace){
                          print(error.toString());
                        });

                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text('ADD TO BASKET',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal,fontFamily: 'RobotoMedium',),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Icon(Icons.favorite_border,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Product details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                      const Text('MATERIALS',style: TextStyle(fontSize: 20,fontFamily: 'RobotoMedium',fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                    const Text('We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products. ',
                      style:
                      TextStyle(
                        fontFamily: 'RobotoMedium',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Text('CARE',style: TextStyle(fontSize: 20,fontFamily: 'RobotoMedium',fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    const Text('To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.',
                      style:
                      TextStyle(
                        fontFamily: 'RobotoMedium',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/bleach.png'),
                              iconSize: 25,  // Set the size of the icon
                              onPressed: () {

                              },
                            ),

                            Text('Do not use bleach',
                              style:
                              TextStyle(
                                fontSize: 14,
                                fontFamily: 'RobotoMedium',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/tumbledry.png'),
                              iconSize: 25,  // Set the size of the icon
                              onPressed: () {

                              },
                            ),

                            Text('Do not tumble dry',
                              style:
                              TextStyle(
                                fontFamily: 'RobotoMedium',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/wash.png'),
                              iconSize: 25,  // Set the size of the icon
                              onPressed: () {

                              },
                            ),

                            Text('Dry clean with tetrachloroethylene',
                              style:
                              TextStyle(
                                fontFamily: 'RobotoMedium',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/lowtemp.png'),
                              iconSize: 25,  // Set the size of the icon
                              onPressed: () {

                              },
                            ),

                            Text('Iron at a maximum of 110ºC/230ºF',
                              style:
                              TextStyle(
                                fontFamily: 'RobotoMedium',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('CARE',style: TextStyle(fontSize: 18,fontFamily: 'RobotoMedium',),),
                    SizedBox(height: 3,),

                    // ListView.builder(
                    //   shrinkWrap: true,  // Prevents ListView from taking infinite space
                    //   physics: NeverScrollableScrollPhysics(),  // Disables scrolling within ListView (handled by SingleChildScrollView)
                    //   itemCount: 3, // Number of list items
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         ListTile(
                    //           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),  // Remove vertical padding to reduce the gap
                    //           title: Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               // Left side: Custom image icon (smaller size)
                    //               Row(
                    //                 children: [
                    //                   Image.asset(
                    //                     iconpaths[index], // Replace with your custom image
                    //                     width: 20,  // Decreased width
                    //                     height: 20, // Decreased height
                    //                   ),
                    //                   const SizedBox(width: 10,),
                    //                   // Middle side: Text (smaller font size)
                    //                   carepolicies[index],
                    //                 ],
                    //               ),
                    //               // Right side: Dropdown arrow icon (smaller size)
                    //               const Icon(
                    //                 Icons.keyboard_arrow_down,
                    //                 size: 20,  // Decreased icon size
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         // Divider between items
                    //         if (index != 2)  // Don't add divider after the last item
                    //           const Divider(
                    //             height: 1,  // Set the height of the divider line
                    //             thickness: 1,  // Set the thickness of the line
                    //             color: Colors.grey,  // Set the color of the divider
                    //             indent: 10,  // Set the indent for the divider to match the content
                    //             endIndent: 10,  // Set the end indent for the divider to match the content
                    //           ),
                    //       ],
                    //     );
                    //   },
                    // ),


                    Column(
                      children: List.generate(3, (index) {
                        return Column(
                          children: [
                            ExpansionTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Left side: Custom image icon and text
                                  Row(
                                    children: [
                                      Image.asset(
                                        iconpaths[index], // Replace with your custom image
                                        width: 20,  // Icon width
                                        height: 20, // Icon height
                                      ),
                                      const SizedBox(width: 10),
                                      // Middle side: Text
                                      carepolicies[index],
                                    ],
                                  ),
                                  // Right side: The trailing arrow is built-in in ExpansionTile
                                ],
                              ),
                              children: <Widget>[
                                // Content that expands under the tile
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    expandabletilecontent[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Divider between items
                            if (index != 2)  // Avoid adding a divider after the last item
                              const Divider(
                                height: 1,  // Set the height of the divider line
                                thickness: 1,  // Set the thickness of the line
                                color: Colors.grey,  // Divider color
                                indent: 10,  // Match the content indent
                                endIndent: 10,  // Match the content end indent
                              ),
                          ],
                        );
                      }),
                    ),


                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  // Remove the width property, so it takes the width of the text
                  child: UiHelper.CustomText(
                    text: "YOU MAY ALSO LIKE",
                    color: Colors.black,
                    fontweight: FontWeight.w700,
                    fontsize: 24.0,
                    fontfamily: "BodoniModa", // Use your desired font family
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey,  // Color of the divider line
                thickness: 1.0,      // Thickness of the line
                indent: 20.0,        // Left padding from the edge
                endIndent: 20.0,     // Right padding from the edge
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true, // Ensures GridView does not take up unnecessary space
                  physics: NeverScrollableScrollPhysics(), // Disables scrolling within GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two columns
                    crossAxisSpacing: 8.0, // Space between columns
                    mainAxisSpacing: 8.0, // Space between rows
                    childAspectRatio: 0.75, // Adjust the aspect ratio for better content fitting
                  ),
                  itemCount: 4, // Example catalog items count
                  itemBuilder: (context, index) {
                    return CatalogItem(
                      cart: dummyCartData[index],
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdetailpage(cart: dummyCartData[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Footer(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSizeCircle(String size, Function setState) {
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedSize = size; // Update the selected size
      });
    },
    child: Container(
      width: 20.0,
      height: 20.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: selectedSize == size ? Color(0xFF333333) : Colors.grey,
          width: 2.0,
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 10.0,
          fontFamily: 'RobotoMedium',
          fontWeight: FontWeight.bold,
          color: selectedSize == size ? Colors.black : Colors.grey,
        ),
      ),
    ),
  );
}
