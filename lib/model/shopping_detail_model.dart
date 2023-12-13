class CartModel {
  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;
  final String? unitTag;
  final String? image;

  CartModel({
    this.id,
    this.productId,
    this.productName,
    this.initialPrice,
    this.productPrice,
    this.quantity,
    this.unitTag,
    this.image,
  });
  CartModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        initialPrice = res['initialPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        unitTag = res['unitTag'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "productId": productId,
      "productName": productName,
      "initialPrice": initialPrice,
      "productPrice": productPrice,
      "quantity": quantity,
      "unitTag": unitTag,
      "image": image,
    };
  }
}
