import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Helper/cart_provider.dart';
import 'package:openfashion/Pages/ProductDetailPage.dart';
import 'package:openfashion/Widgets/CatelogItem.dart';
import 'package:openfashion/Widgets/CatelogPageItem.dart';
import 'package:openfashion/Widgets/Footer.dart';
import 'package:openfashion/Widgets/SideBarMenu.dart';
import 'package:openfashion/Widgets/customappbar.dart';
import 'package:provider/provider.dart';

class CatelogPage extends StatefulWidget {

  CatelogPage({super.key});

  @override
  State<CatelogPage> createState() => _CatelogPageState();
}

class _CatelogPageState extends State<CatelogPage> {
  final List<Cart> dummyCartData = [
    Cart(
      id: 1,
      productId: 'P001',
      productName: 'Classic Shirt',
      initialPrice: 1500,
      productPrice: 1200,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog1.png',
    ),
    Cart(
      id: 2,
      productId: 'P002',
      productName: 'Summer Dress',
      initialPrice: 2000,
      productPrice: 1800,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog2.png',
    ),
    Cart(
      id: 3,
      productId: 'P003',
      productName: 'Leather Wallet',
      initialPrice: 1000,
      productPrice: 900,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog3.png',
    ),
    Cart(
      id: 4,
      productId: 'P004',
      productName: 'Elegant Watch',
      initialPrice: 3000,
      productPrice: 2700,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog4.png',
    ),
    Cart(
      id: 5,
      productId: 'P005',
      productName: 'Running Shoes',
      initialPrice: 4000,
      productPrice: 3500,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog5.png',
    ),
    Cart(
      id: 6,
      productId: 'P006',
      productName: 'Sports T-Shirt',
      initialPrice: 800,
      productPrice: 750,
      quantity: 3,
      image: 'assets/Images/catelogPage/catalog6.png',
    ),
    Cart(
      id: 7,
      productId: 'P007',
      productName: 'Formal Blazer',
      initialPrice: 5000,
      productPrice: 4500,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog7.png',
    ),
    Cart(
      id: 8,
      productId: 'P008',
      productName: 'Casual Jeans',
      initialPrice: 2200,
      productPrice: 2000,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog8.png',
    ),
    Cart(
      id: 9,
      productId: 'P009',
      productName: 'Silk Scarf',
      initialPrice: 1200,
      productPrice: 1000,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog9.png',
    ),
    Cart(
      id: 10,
      productId: 'P010',
      productName: 'Designer Handbag',
      initialPrice: 8000,
      productPrice: 7500,
      quantity: 1,
      image: 'assets/Images/catelogPage/catalog10.png',
    ),
  ];

  String dropdownVALUE="New";
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: CustomAppBar(titleText: "Open Fashion"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text("45000 APPAREL",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: const Color(0x1AC4C4C4), // Semi-transparent background
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners
                            ),
                            child: DropdownButton<String>(
                              value: dropdownVALUE,
                              isDense: true, // Ensures the DropdownButton takes less vertical space
                              underline: SizedBox(), // Removes the default underline
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFF333333),
                              ),
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownVALUE = newValue!;
                                });
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'New',
                                  child: Text('New',),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'High to Low',
                                  child: Text('High to Low',),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Low to High',
                                  child: Text('Low to High',),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Highest Rating',
                                  child: Text('Highest Rating',),
                                ),
                              ],
                            ),
                          ),

                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: 48.0, // Height of the container
                          width: 48.0, // Width of the container
                          decoration: BoxDecoration(
                            color: const Color(0x1AC4C4C4), // Grey background color
                            borderRadius: BorderRadius.circular(16.0), // Rounded corners
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.list_alt_outlined, // Replace with any icon you need
                              color: Color(0xFF333333), // Icon color (white for contrast)
                              size: 24.0, // Icon size
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: const Color(0x1AC4C4C4), // Semi-transparent background
                            borderRadius: BorderRadius.circular(30.0), // Rounded corners
                          ),
                          child: const Icon(Icons.sort,color: Color(0xFFDD8560),),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(label: const Text('Women'),
                      deleteIcon: Icon(Icons.close,color: Color(0xFF333333),),
                      onDeleted: (){

                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(label: const Text('All Apparel'),
                      deleteIcon: Icon(Icons.close,color: Color(0xFF333333),),
                      onDeleted: (){

                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true, // Ensures GridView does not take up unnecessary space
                physics: const NeverScrollableScrollPhysics(), // Disables scrolling within GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 8.0, // Space between rows
                  childAspectRatio: 0.75, // Adjust the aspect ratio for better content fitting
                ),
                itemCount: dummyCartData.length, // Example catalog items count
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ProductDetailPage on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productdetailpage(
                            cart: dummyCartData[index],
                          ),
                        ),
                      );
                    },
                    child: CatelogPageItem(
                      productName: dummyCartData[index].image.toString(),
                      price: '\$${dummyCartData[index].productPrice}',
                      description: dummyCartData[index].productName.toString(),
                    ),
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
    );
  }
}
