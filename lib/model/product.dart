class Product {
  String id;
  String name;
  String description;
  double unitPrice;
  String imageUrl;
  String categoryName;
  String vendorId;
  bool isAvailable;
  int quantity;

  Product({
    this.id,
    this.name,
    this.description,
    this.unitPrice,
    this.imageUrl,
    this.categoryName,
    this.vendorId,
    this.isAvailable,
    this.quantity,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    unitPrice = json['unitPrice'];
    imageUrl = json['imageUrl'];
    categoryName = json['categoryName'];
    vendorId = json['vendorId'];
    isAvailable = json['isAvailable'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['unitPrice'] = this.unitPrice;
    data['imageUrl'] = this.imageUrl;
    data['categoryName'] = this.categoryName;
    data['vendorId'] = this.vendorId;
    data['isAvailable'] = this.isAvailable;
    data['quantity'] = this.quantity;
    return data;
  }
}
