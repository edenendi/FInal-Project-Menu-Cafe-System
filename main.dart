// main.dart
import 'dart:io';
import 'dish.dart';
import 'menu_manager.dart';
import 'utils.dart';

// Enum untuk pilihan menu.
enum MenuOption {
  addDish,
  updateDish,
  removeDish,
  displayMenu,
  searchDish,
  saveToFile,
  loadFromFile,
  sortDishes,
  exit,
}

void main() {
  final menuManager = MenuManager();
  final String menuFile = 'menu.json';

  displayBanner();

  while (true) {
    displayMenuOptions();
    stdout.write('${fgYellow}Pilihan Anda: ${reset}');
    var choice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (choice < 1 || choice > MenuOption.values.length) {
      print('${fgRed}Pilihan tidak valid. Silakan coba lagi.${reset}');
      continue;
    }

    final menuOption = MenuOption.values[choice - 1];

    switch (menuOption) {
      case MenuOption.addDish:
        stdout.write('${fgCyan}Masukkan ID: ${reset}');
        var id = int.tryParse(stdin.readLineSync() ?? '');
        if (id == null) {
          print('${fgRed}ID tidak valid.${reset}');
          continue;
        }

        stdout.write('${fgCyan}Masukkan Nama: ${reset}');
        var name = stdin.readLineSync() ?? '';
        if (name.isEmpty) {
          print('${fgRed}Nama tidak valid.${reset}');
          continue;
        }

        stdout.write('${fgCyan}Masukkan Harga: ${reset}');
        var price = double.tryParse(stdin.readLineSync() ?? '');
        if (price == null || price <= 0) {
          print('${fgRed}Harga tidak valid.${reset}');
          continue;
        }

        var dish = Dish(id, name, price);
        menuManager.addDish(dish);
        break;

      case MenuOption.updateDish:
        stdout.write(
            '${fgCyan}Masukkan ID hidangan yang akan diperbarui: ${reset}');
        var id = int.tryParse(stdin.readLineSync() ?? '');
        if (id == null) {
          print('${fgRed}ID tidak valid.${reset}');
          continue;
        }

        stdout.write('${fgCyan}Masukkan Nama baru: ${reset}');
        var newName = stdin.readLineSync() ?? '';
        if (newName.isEmpty) {
          print('${fgRed}Nama tidak valid.${reset}');
          continue;
        }

        stdout.write('${fgCyan}Masukkan Harga baru: ${reset}');
        var newPrice = double.tryParse(stdin.readLineSync() ?? '');
        if (newPrice == null || newPrice <= 0) {
          print('${fgRed}Harga tidak valid.${reset}');
          continue;
        }

        menuManager.updateDish(id, newName, newPrice);
        break;

      case MenuOption.removeDish:
        stdout
            .write('${fgCyan}Masukkan ID hidangan yang akan dihapus: ${reset}');
        var id = int.tryParse(stdin.readLineSync() ?? '');
        if (id == null) {
          print('${fgRed}ID tidak valid.${reset}');
          continue;
        }

        menuManager.removeDish(id);
        break;

      case MenuOption.displayMenu:
        menuManager.displayMenu();
        break;

      case MenuOption.searchDish:
        stdout.write('${fgCyan}Masukkan Nama hidangan yang dicari: ${reset}');
        var name = stdin.readLineSync() ?? '';
        if (name.isEmpty) {
          print('${fgRed}Nama tidak valid.${reset}');
          continue;
        }
        menuManager.searchDish(name);
        break;

      case MenuOption.saveToFile:
        menuManager.saveToFile(menuFile);
        break;

      case MenuOption.loadFromFile:
        menuManager.loadFromFile(menuFile);
        break;

      case MenuOption.sortDishes:
        while (true) {
          displaySortOptions();
          stdout.write('${fgYellow}Pilihan Anda: ${reset}');
          var sortChoice = int.tryParse(stdin.readLineSync() ?? '');

          if (sortChoice == 1) {
            menuManager.sortByName();
            break;
          } else if (sortChoice == 2) {
            menuManager.sortByPrice();
            break;
          } else if (sortChoice == 3) {
            break;
          } else {
            print('${fgRed}Pilihan tidak valid. Silakan coba lagi.${reset}');
          }
        }
        break;

      case MenuOption.exit:
        print('${fgGreen}Keluar dari aplikasi.${reset}');
        return;
    }
  }
}
