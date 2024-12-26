import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Pages/CatelogPage.dart';
import 'package:openfashion/Pages/ProductDetailPage.dart';
import 'package:openfashion/Pages/homepage.dart';
import 'package:openfashion/Widgets/CatelogItem.dart';
import 'package:openfashion/Widgets/FlexibleTabbarView.dart';
import 'package:openfashion/Widgets/Footer.dart';
import 'package:openfashion/Widgets/SideBarMenu.dart';
import 'package:openfashion/Widgets/customappbar.dart';
import 'package:openfashion/Widgets/gridView.dart';
import 'package:openfashion/Widgets/uiHelper.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, String>> catalogItems = [
    {
      'productName': 'assets/Images/catalog1.png',
      'price': '\$45.00',
      'description': 'High-quality shirt made of premium fabric.',
    },
    {
      'productName': 'assets/Images/catalog2.png',
      'price': '\$30.00',
      'description': 'Elegant watch with a leather strap.',
    },
    {
      'productName': 'assets/Images/catalog1.png',
      'price': '\$15.00',
      'description': 'Stylish sunglasses for everyday wear.',
    },
  ];
  final List<String> tabs = ["All", "Apparel", "Dress", "Tshirt", "Bag"];
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
  final List<Map<String, String>> gridItems = [
    {
      'productName': 'assets/Images/bottomgridview/iconone.png',
      'description': 'Fast shipping. Free on \norders over \$25.',
    },
    {
      'productName': 'assets/Images/bottomgridview/icontwo.png',
      'description': 'Sustainable process\nfrom start to finish.',
    },
    {
      'productName': 'assets/Images/bottomgridview/iconthree.png',
      'description': 'Unique designs\n and high-quality materials.',
    },
    {
      'productName': 'assets/Images/bottomgridview/iconfour.png',
      'description': 'Fast shipping.\nFree on orders over \$25.',
    },
  ];
  final List<String> instagram = [
    'assets/instagram/profileone.png',
    'assets/instagram/profiletwo.png',
    'assets/instagram/profilethree.png',
    'assets/instagram/profilefour.png',
  ];
  final List<String> brandpaths = [
    'assets/Images/brandicons/boss.png',
    'assets/Images/brandicons/Burberry.png',
    'assets/Images/brandicons/Catier.png',
    'assets/Images/brandicons/Gucci.png',
    'assets/Images/brandicons/Prada.png',
    'assets/Images/brandicons/tiffanyandco.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: CustomAppBar(titleText: "Open Fashion"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Image widget
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Takes full screen width
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/Images/bannner.png',
                        fit: BoxFit
                            .cover, // Image will scale to cover the entire container
                      ),
                    ),
                  ),
                ),

                // Text widget vertically centered
                Positioned(
                  top: 0, // Start from top of the container
                  bottom: 0,
                  left: 25, // End at the bottom of the container
                  child: Align(
                    alignment: Alignment.center,
                    child: UiHelper.CustomText(
                      text: "LUXURY\n   FASHION\n & ACCESSORIES",
                      color: Color(0xFF333333),
                      fontweight: FontWeight.w700,
                      fontsize: 36.0,
                      fontfamily: "BodoniModa", // Use your desired font family
                    ),
                  ),
                ),

                // Button container at the bottom
                Positioned(
                  bottom: 30.0,
                  // Adjusts the position from the bottom of the Stack
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the ProductDetailPage on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatelogPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          // Semi-transparent background
                          borderRadius:
                              BorderRadius.circular(30.0), // Rounded corners
                        ),
                        child: Text(
                          "Explore Collections",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: UiHelper.CustomText(
                  text: "NEW ARRIVAL",
                  color: Colors.black,
                  fontweight: FontWeight.w700,
                  fontsize: 24.0,
                  fontfamily: "BodoniModa", // Use your desired font family
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, // Color of the divider line
              thickness: 1.0, // Thickness of the line
              indent: 20.0, // Left padding from the edge
              endIndent: 20.0, // Right padding from the edge
            ),

            const SizedBox(
              height: 20,
            ),
            FixedSizeTabBarView(), // The custom widget
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  // Remove the width property, so it takes the width of the text
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatelogPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomText(
                      text: "Explore More",
                      color: Colors.black,
                      fontweight: FontWeight.w700,
                      fontsize: 24.0,
                      fontfamily: "BodoniModa", // Use your desired font family
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, // Color of the divider line
              thickness: 1.0, // Thickness of the line
              indent: 20.0, // Left padding from the edge
              endIndent: 20.0, // Right padding from the edge
            ),

            const SizedBox(
              height: 10,
            ),

// R and D

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300.0, // Provide a fixed height for the GridView
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns
                    mainAxisSpacing: 8.0, // Space between rows
                    crossAxisSpacing: 8.0, // Space between columns
                  ),
                  itemCount: 6,
                  // Total 3 columns * 2 rows = 6 items
                  physics: NeverScrollableScrollPhysics(),
                  // Prevent scrolling
                  shrinkWrap: true,
                  // Make GridView take only the necessary space
                  itemBuilder: (context, index) {
                    return Image.asset(
                      brandpaths[index], // List of image paths
                      fit: BoxFit.none, // Display image as is, without scaling
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, // Color of the divider line
              thickness: 1.0, // Thickness of the line
              indent: 20.0, // Left padding from the edge
              endIndent: 20.0, // Right padding from the edge
            ),

            const SizedBox(
              height: 45,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: UiHelper.CustomText(
                  text: "COLLECTIONS",
                  color: Colors.black,
                  fontweight: FontWeight.w700,
                  fontsize: 24.0,
                  fontfamily: "BodoniModa", // Use your desired font family
                ),
              ),
            ),

            // Image widget
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Takes full screen width
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Productdetailpage(cart: dummyCartData[0]),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Images/bannertwo.png',
                      fit: BoxFit
                          .cover, // Image will scale to cover the entire container
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Stack(
              children: [
                // Image in the background
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width, // Full screen width
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Productdetailpage(cart: dummyCartData[0]),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/Images/bannerthree.png',
                        fit: BoxFit
                            .cover, // Image will scale to cover the container
                      ),
                    ),
                  ),
                ),

                // Texts on top of the image
                Positioned(
                  top: 50, // Adjust top position
                  left: 175, // Adjust left position
                  child: UiHelper.CustomText(
                    text: "Autumn",
                    color: Color(0xFF333333),
                    fontweight: FontWeight.w800,
                    fontsize: 38.0,
                    fontfamily: "BodoniModa", // Use your desired font family
                  ),
                ),
                Positioned(
                  top: 100, // Adjust top position
                  left: 200, // Adjust left position
                  child: UiHelper.CustomText(
                    text: "COLLECTION",
                    color: Color(0xFF333333),
                    fontweight: FontWeight.w300,
                    fontsize: 18.0,
                    fontfamily: "BodoniModa", // Use your desired font family
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Takes full screen width
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/Images/Video.png',
                    fit: BoxFit
                        .cover, // Image will scale to cover the entire container
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: UiHelper.CustomText(
                  text: "JUST FOR YOU",
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                  fontsize: 18.0,
                  fontfamily: "BodoniModa", // Use your desired font family
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, // Color of the divider line
              thickness: 1.0, // Thickness of the line
              indent: 20.0, // Left padding from the edge
              endIndent: 20.0, // Right padding from the edge
            ),

            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300, // Set height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCartData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 180, // Set a fixed width for each CatalogItem
                      child: CatalogItem(
                        cart: dummyCartData[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Productdetailpage(cart: dummyCartData[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: UiHelper.CustomText(
                  text: "@ TRENDING",
                  color: Colors.black,
                  fontweight: FontWeight.w300,
                  fontsize: 24.0,
                  fontfamily: "BodoniModa", // Use your desired font family
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                        label: const Text("#2021"),
                        onSelected: (bool value) {}),
                    FilterChip(
                        label: const Text("#spring"),
                        onSelected: (bool value) {}),
                    FilterChip(
                        label: const Text("#collection"),
                        onSelected: (bool value) {}),
                    FilterChip(
                        label: const Text("#fall"),
                        onSelected: (bool value) {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                        label: const Text("#dress"),
                        onSelected: (bool value) {}),
                    FilterChip(
                        label: const Text("#autumncollection"),
                        onSelected: (bool value) {}),
                    FilterChip(
                        label: const Text("#openfashion"),
                        onSelected: (bool value) {}),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: Text(
                  "Open\nFahion",
                  style: TextStyle(
                    fontSize: 28,
                    height: 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: Text(
                  "Making a luxurious lifestyle accessible \nfor a generous group of women is our \ndaily drive.",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey, // Color of the divider line
              thickness: 1.0, // Thickness of the line
              indent: 20.0, // Left padding from the edge
              endIndent: 20.0, // Right padding from the edge
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                // Ensures GridView does not take up unnecessary space
                physics: NeverScrollableScrollPhysics(),
                // Disables scrolling within GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 8.0, // Space between rows
                  childAspectRatio:
                      1.24, // Adjust the aspect ratio for better content fitting
                ),
                itemCount: 4,
                // Example catalog items count
                itemBuilder: (context, index) {
                  return GridViewItem(
                    productName: gridItems[index]['productName'],
                    description: gridItems[index]['description'],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                // Remove the width property, so it takes the width of the text
                child: Text(
                  "FOLLOW US",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Clicked on Instagram'),
                    ),
                  );
                },
                child: Container(
                  child: Image.asset(
                    'assets/icons/instagram.png',
                    fit: BoxFit
                        .cover, // Image will scale to cover the entire container
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400.0, // Provide a fixed height for the GridView
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0, // Space between rows
                    crossAxisSpacing: 4.0, // Space between columns
                  ),
                  itemCount: 4,
                  // Total 3 columns * 2 rows = 6 items
                  physics: NeverScrollableScrollPhysics(),
                  // Prevent scrolling
                  shrinkWrap: true,
                  // Make GridView take only the necessary space
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    const Text('Followed @mia on Instagram'),
                              ));
                            },
                            child: Image.asset(
                              instagram[index], // List of image paths
                              fit: BoxFit.cover,
                              // Ensures the image covers its container
                              width: double.infinity,
                              // Matches the container width
                              height: double
                                  .infinity, // Display image as is, without scaling
                            ),
                          ),
                          Positioned(
                            bottom: 4.0, // Distance from the bottom
                            left: 4.0,
                            child: Text(
                              '@mia',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Footer(context),
          ],
        ),
      ),
    );
  }
}
