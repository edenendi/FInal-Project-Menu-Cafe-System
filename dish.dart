// dish.dart
class Dish {
  int id;
  String name;
  double price;

  Dish(this.id, this.name, this.price);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      json['id'],
      json['name'],
      json['price'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'ID: $id, Nama: $name, Harga: Rp${price.toStringAsFixed(2)}';
  }
}
