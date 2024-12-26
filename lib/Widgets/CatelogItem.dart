import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Helper/cart_model.dart';
import 'package:openfashion/Pages/ProductDetailPage.dart';

class CatalogItem extends StatelessWidget {
  // final String productName;
  // final String price;
  // final String description;
  final Cart cart;
  final VoidCallback onTap; // Add a callback function for the onTap event
  const CatalogItem({
    required this.cart,
    required this.onTap, // Constructor requires onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(cart.image.toString()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'This is the default description of a product. It may be a bit long so please adjust with me from the developer dhairya',
                style: TextStyle(fontSize: 12,fontFamily: 'RobotoMedium', color: Color(0xFF555555),),
                textAlign: TextAlign.center,
                maxLines: 2, // Limit to 2 lines
                overflow: TextOverflow.ellipsis, // Show ellipsis if description exceeds 2 lines
              ),
            ),
            Text(
              '\$${cart.productPrice}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFFDD8560),fontFamily: 'RobotoMedium',),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );




  }
}