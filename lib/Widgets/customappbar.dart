// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_provider.dart';
import 'package:openfashion/Pages/CartPage.dart';
import 'package:openfashion/Pages/homepage.dart';
import 'package:openfashion/Widgets/uiHelper.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText; // You can pass a title to customize the app bar title if needed

  CustomAppBar({this.titleText = "Open Fashion"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Background color of the AppBar
      elevation: 0, // Removes AppBar shadow
      title: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ),
          );
        },
        child: UiHelper.CustomText(
          text: titleText,
          color: Colors.black,
          fontweight: FontWeight.bold,
          fontsize: 20.0,
          fontfamily: "BodoniModa", // Use your desired font family
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black), // Centers the title
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {
            // Handle search icon press
          },
        ),
        IconButton(
          icon: badges.Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context,value,child){
                return Text(value.getCounter().toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'RobotoMedium',),);
              },
    ),
            child: const Icon(
              Icons.shopping_cart, 
              color: Colors.black
            ),
          ),
          onPressed: () {
            // Handle cart icon press
            if (ModalRoute.of(context)?.settings.name != '/cart') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cartpage(),
                  settings: RouteSettings(name: '/cart'),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Required for the PreferredSizeWidget
}