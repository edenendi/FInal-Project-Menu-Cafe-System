// utils.dart
const String bright = '\x1B[1m';
const String reset = '\x1B[0m';
const String fgBlue = '\x1B[34m';
const String fgCyan = '\x1B[36m';
const String fgYellow = '\x1B[33m';
const String fgGreen = '\x1B[32m';
const String fgRed = '\x1B[31m';

void displayBanner() {
  print('''
${fgCyan}
       ╔════════════════════════════════════════════════════════════════════════════════════════╗
                                         ${bright}Welcome to Café!${reset}${fgCyan}          
       ╚════════════════════════════════════════════════════════════════════════════════════════╝

${fgBlue}    _   _ ____     ____ ___  _____ _____ _____ _____    ___      ____ _   _ _   _____ _   _ ____  _____ 
   | \\ | |  _ \\   / ___/ _ \\|  ___|  ___| ____| ____|  ( _ )    / ___| | | | | |_   _| | | |  _ \\| ____|
   |  \\| | | | | | |  | | | | |_  | |_  |  _| |  _|    / _ \\/\\ | |   | | | | |   | | | | | | |_) |  _|  
   | |\\  | |_| | | |__| |_| |  _| |  _| | |___| |___  | (_>  < | |___| |_| | |___| | | |_| |  _ <| |___ 
   |_| \\_|____/   \\____\\___/|_|   |_|   |_____|_____|  \\___/\\/  \\____|\\___/|_____|_|  \\___/|_| \\_\\_____| 
${reset}''');
}

void displayMenuOptions() {
  print('''
${fgYellow}Pilih aksi:${reset}
${fgCyan}1.${reset} Tambah Hidangan
${fgCyan}2.${reset} Perbarui Hidangan
${fgCyan}3.${reset} Hapus Hidangan
${fgCyan}4.${reset} Tampilkan Menu
${fgCyan}5.${reset} Cari Hidangan
${fgCyan}6.${reset} Simpan Menu ke File
${fgCyan}7.${reset} Muat Menu dari File
${fgCyan}8.${reset} Urutkan Hidangan
${fgCyan}9.${reset} Keluar
''');
}

void displaySortOptions() {
  print('''
${fgYellow}Pilih metode pengurutan:${reset}
${fgCyan}1.${reset} Urutkan berdasarkan Nama
${fgCyan}2.${reset} Urutkan berdasarkan Harga
${fgCyan}3.${reset} Kembali ke Menu Utama
''');
}
