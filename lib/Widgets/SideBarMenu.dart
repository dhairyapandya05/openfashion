import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfashion/Widgets/BasicTile.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.close, color: Colors.black),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height, // Adjust height for visibility
              child: const TabBarSection(),
            ),
            const SizedBox(
              height: 7,
            ),
            // BottomSideMenu(),
          ],
        ),
      ),
    );
  }
}



final basictiles =<BasicTile>[
    const BasicTile(title: 'New',dropdownicon: true),
    const BasicTile(title: 'Apparel',dropdownicon: true,
    tiles: [
      BasicTile(title: 'Outer'),
      BasicTile(title: 'Dress'),
      BasicTile(title: 'Blouse/Shirt'),
      BasicTile(title: 'T-Shirt'),
      BasicTile(title: 'Knitwear'),
      BasicTile(title: 'Skirt'),
      BasicTile(title: 'Pants'),
      BasicTile(title: 'Denim'),
      BasicTile(title: 'Kids'),

    ]),
    const BasicTile(title: 'Bag',dropdownicon: true),
    const BasicTile(title: 'Shoes',dropdownicon: true),
    const BasicTile(title: 'Beauty',dropdownicon: true),
    const BasicTile(title: 'Accessories',dropdownicon: true),
    const BasicTile(title: '(786) 713-8616',leading: Icon(Icons.phone_enabled_outlined, color: Color(0xFF555555)),dropdownicon: false),
    const BasicTile(title: 'Store locator',leading: Icon(Icons.location_on_outlined, color: Color(0xFF555555)),dropdownicon: false),
  // Ending Part
  const BasicTile(),

];
class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Prevents adding a back button
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 40.0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              tabs: [
                Tab(text: 'WOMEN'),
                Tab(text: 'MAN'),
                Tab(text: 'KIDS'),
              ],
              indicatorColor: Color(0xFFDD8560),
              labelColor: Color(0xFF333333),
              unselectedLabelColor: Color(0xFF555555),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView(
                children: basictiles.map(buildTile).toList(),
              ),
            ),
            Container(
              child: ListView(
                children: basictiles.map(buildTile).toList(),
              ),
            ),
            Container(
              child: ListView(
                children: basictiles.map(buildTile).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTile(BasicTile tile, {double leftPadding = 16}) {
  return ExpansionTile(
    tilePadding: EdgeInsets.only(left: leftPadding),
    leading: tile.leading,
    title: tile.title != null
        ? Text(tile.title!) // If title is provided, display it
        : SocialMediaWidget(), // Display a default widget if title is null
    trailing: tile.dropdownicon == true
        ? const Padding(
            padding: EdgeInsets.only(
                right: 10.0), // Padding of 10 on the right
            child: Icon(Icons.keyboard_arrow_down),
          )
        : const SizedBox.shrink(),
    // Hide the trailing icon

    children: tile.tiles
        .map((tile) => buildTile(tile, leftPadding: leftPadding + 16.0))
        .toList(),
  );
}
Widget SocialMediaWidget(){
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,  // Color of the divider line
          thickness: 1.0,      // Thickness of the line
          indent: 20.0,        // Left padding from the edge
          endIndent: 20.0,     // Right padding from the edge
        ),

        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space children equally
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/Twitter.png'),
            Image.asset('assets/icons/Vector.png'),
            Image.asset('assets/icons/YouTube.png'),
          ],
        ),
      ],
    ),
  );
}