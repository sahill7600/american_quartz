class ProductList {
  final int? id;
  final String? product_name;
  final List<String>? product_image;
  final String? size;
  final String? thickness;
  final String? finish;
  final int? category_id;
  final String? category_name;

  ProductList(
      {this.id,
      this.product_name,
      this.product_image,
      this.size,
      this.thickness,
      this.finish,
      this.category_id,
      this.category_name});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    return ProductList(
        id: json['id'],
        product_name: json['product_name'],
        product_image: json['product_image'].cast<String>(),
        size: json['size'],
        thickness: json['thickness'],
        finish: json['finish'],
        category_id: json['category_id'],
        category_name: json['category_name']);
  }
}
