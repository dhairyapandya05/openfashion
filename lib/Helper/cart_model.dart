class Cart{
  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int?productPrice;
  final int? quantity;
  final String? image;


  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.image
});


  // used from the database
  Cart.fromMap(Map<dynamic,dynamic> res)
      :id=res['id']??'',
  productId=res['productId']??'',
  productName=res['productName']??'',
  initialPrice=res['initialPrice']??0.0,
  productPrice=res['productPrice']??0.0,
  quantity=res['quantity']??0,
  image=res['image']??'';


  // coming to the database
  Map<String,Object?> toMap(){
    return {
      'id':id,
      'productId':productId,
      'productName':productName,
      'initialPrice':initialPrice,
      'productPrice':productPrice,
      'quantity':quantity,
      'image':image,
    };
  }
}