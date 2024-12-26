import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Pages/ProductDetailPage.dart';
import 'package:openfashion/Widgets/CatelogItem.dart';

class FixedSizeTabBarView extends StatelessWidget {
  final List<String> tabs = ['All', 'Apparel', 'Dress', 'TShirt', 'Bags'];

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length, // Set the number of tabs
      child: Container(
        height: 600, // Set the fixed height for the TabBar and TabBarView widget
        width: double.infinity,
        child: Column(
          children: [
            // TabBar inside a Container
            Container(
              width: double.infinity, // Full width for TabBar
              color: Colors.white,
              child: TabBar(
                isScrollable: false, // Makes the TabBar horizontally scrollable
                tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                indicatorColor: Color(0xFFDD8560),
                labelColor: Color(0xFF333333),
                unselectedLabelColor: Color(0xFF555555),
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            // TabBarView displaying content inside each tab
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) {
                  return homescreengridView(dummyCartData);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget homescreengridView(List<Cart> dummycart){
  return Padding(
    padding: EdgeInsets.all(8.0),
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
        return CatalogItem(cart: dummycart[index],
          onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Productdetailpage(cart: dummycart[index]),
            ),
          );
        },);
      },
    ),
  );
}