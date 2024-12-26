import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Pages/ProductDetailPage.dart';



class CatelogPageItem extends StatelessWidget {

  final String productName;
  final String price;
  final String description;
  const CatelogPageItem({super.key, required this.productName, required this.price, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 170.0,

            child: Stack(
              // fit: StackFit.expand,
              children: [
                Image.asset(productName,fit: BoxFit.fitWidth,width: double.infinity,),
                Positioned(
                  bottom: 5.0,  // Distance from the bottom
                  right: 5.0,
                  child: Icon(Icons.favorite_border,color: Color(0xFFDD8560),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis, // Show ellipsis if description exceeds 2 lines
            ),
          ),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFFDD8560)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
