import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final String? productName;
  final String? description;


  const GridViewItem({
    required this.productName,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(productName?? 'assets/Images/default_image.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description?? 'This is the default \n description of the item View',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis, // Show ellipsis if description exceeds 2 lines
            ),
          ),
        ],
      ),
    );
  }
}
