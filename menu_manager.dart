// menu_manager.dart
import 'dart:convert';
import 'dart:io';
import 'dish.dart';
import 'utils.dart';

class MenuManager {
  final Map<int, Dish> _dishes = {};

  void addDish(Dish dish) {
    if (_dishes.containsKey(dish.id)) {
      print('${fgRed}Hidangan dengan ID ${dish.id} sudah ada.${reset}');
      return;
    }
    _dishes[dish.id] = dish;
    print('Hidangan berhasil ditambahkan: ${dish.name}');
  }

  void updateDish(int id, String newName, double newPrice) {
    if (_dishes.containsKey(id)) {
      _dishes[id]!
        ..name = newName
        ..price = newPrice;
      print('Hidangan berhasil diperbarui: ${_dishes[id]!.name}');
    } else {
      print('Hidangan dengan ID $id tidak ditemukan.');
    }
  }

  void removeDish(int id) {
    if (_dishes.remove(id) != null) {
      print('Hidangan dengan ID $id berhasil dihapus.');
    } else {
      print('Hidangan dengan ID $id tidak ditemukan.');
    }
  }

  void displayMenu() {
    if (_dishes.isEmpty) {
      print('${fgYellow}--- Menu Kosong ---${reset}');
    } else {
      print('${fgYellow}--- Daftar Menu ---${reset}');
      _dishes.values.forEach(print);
    }
  }

  void searchDish(String name) {
    final results = _dishes.values
        .where((dish) => dish.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    if (results.isEmpty) {
      print(
          '${fgRed}Tidak ada hidangan yang cocok dengan pencarian: $name${reset}');
    } else {
      print('${fgYellow}--- Hasil Pencarian ---${reset}');
      results.forEach(print);
    }
  }

  void sortByName() {
    final sortedDishes = _dishes.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    print('${fgGreen}Menu berhasil diurutkan berdasarkan nama.${reset}');
    sortedDishes.forEach(print);
  }

  void sortByPrice() {
    final sortedDishes = _dishes.values.toList()
      ..sort((a, b) => a.price.compareTo(b.price));
    print('${fgGreen}Menu berhasil diurutkan berdasarkan harga.${reset}');
    sortedDishes.forEach(print);
  }

  void saveToFile(String filename) {
    final file = File(filename);
    final json =
        jsonEncode(_dishes.values.map((dish) => dish.toJson()).toList());
    file.writeAsStringSync(json);
    print('${fgGreen}Menu berhasil disimpan ke file: $filename${reset}');
  }

  void loadFromFile(String filename) {
    final file = File(filename);
    if (!file.existsSync()) {
      print('${fgRed}File $filename tidak ditemukan.${reset}');
      return;
    }
    final json = file.readAsStringSync();
    final List<dynamic> data = jsonDecode(json);
    _dishes.clear();
    data.forEach(
        (item) => _dishes[Dish.fromJson(item).id] = Dish.fromJson(item));
    print('${fgGreen}Menu berhasil dimuat dari file: $filename${reset}');
  }
}
