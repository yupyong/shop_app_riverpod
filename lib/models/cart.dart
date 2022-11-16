class Cart {
  Cart(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imageUrl});

  final String id;
  final String title;
  late final int quantity;
  final int price;
  final String imageUrl;

  Cart copyWith(
      {String? id,
      String? title,
      int? quantity,
      int? price,
      String? imageUrl}) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
