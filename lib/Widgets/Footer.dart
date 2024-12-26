import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Footer(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space children equally
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Navigating to Twitter'),)
              );
            },
            child: Image.asset('assets/icons/Twitter.png'),
          ),
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Navigating to Instagram'),)
              );
            },
              child: Image.asset('assets/icons/Vector.png'),
          ),
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Navigating to Youtube'),)
              );
            },
            child: Image.asset('assets/icons/YouTube.png'),),
        ],
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
      Align(
        alignment: Alignment.center,
        child: Container(
          // Remove the width property, so it takes the width of the text
          child: Text("support@openui.design",
            style: TextStyle(fontSize: 16,
              color: Color(0xFF333333),
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
        child: Container(
          // Remove the width property, so it takes the width of the text
          child: Text("+60 825 876",
            style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF333333),
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
          child: Text("08:00 - 22:00 - Everyday",
            style: TextStyle(fontSize: 16,
              color: Color(0xFF333333),
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),

      Divider(
        color: Colors.grey,  // Color of the divider line
        thickness: 1.0,      // Thickness of the line
        indent: 20.0,        // Left padding from the edge
        endIndent: 20.0,     // Right padding from the edge
      ),

      const SizedBox(
        height: 25,
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space children equally
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Clicked on About'),)
              );
            },
            child: Text("About",
              style: TextStyle(fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Navigating to Contact'),)
              );
            },
            child: Text("Contact",
              style: TextStyle(fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Clicked on Blog'),)
              );
            },
            child: Text("Blog",
              style: TextStyle(fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        height: 45,
        color: Color(0xFFC4C4C4),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            // Remove the width property, so it takes the width of the text
            child: Text("Copyright© OpenUI All Rights Reserved.",
              style: TextStyle(fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}
