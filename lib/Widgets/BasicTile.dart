
import 'package:flutter/cupertino.dart';

class BasicTile{
  final String? title;
  final List<BasicTile> tiles;
  final Widget? leading;
  final bool? endingpart;
  final bool? dropdownicon;


  const BasicTile({
    this.title,
    this.tiles=const[],
    this.leading,
    this.dropdownicon,
    this.endingpart,
});
}