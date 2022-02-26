import 'dart:io';

//soal nomor 1
//membuat fungsi dengan nama grade dan memiliki tipe balikan string serta memiliki parameter dengan tipe double
String Grade(double grade) {
  //jika nilai yang diinput pada parameter diatas 70
  if (grade > 70) {
    //kembalikan string A
    return 'A';
    //tapi jika nilai yang diinput pada parameter diatas 40
  } else if (grade > 40) {
    //kembalikan string B
    return 'B';
    //tapi jika nilai yang diinput pada parameter diatas 0
  } else if (grade > 0) {
    //kembalikan string C
    return 'C';
    //jika bukan dari semua kondisi diatas
  } else {
    //kembalikan string kosong
    return '';
  }
}

//soal nomor 2
//membuat fungsi dengan nama faktorial dengan tipe balikan double dan memiliki parameter dengan tipe double
double Faktorial(double angka) {
  //inisialisasi variabel dengan tipe double dan nama faktorial.
  double faktorial = 1;

  //jika parameter kurang dari 0
  if (angka < 0) {
    //maka tampilkan angka harus bilangan bulat atau > 0
    print("Angka yang dimasukkan bukan bilangan bulat");
    //jika lebih dari 0
  } else {
    //maka lakukan perulangan mulai dari 1 sampai dengan angka parameter
    for (int i = 1; i <= angka; i++) {
      //setiap perulangan maka nilai faktorial yang awalnya 1 dikalikan dengan setiap indeks dari perulangan
      faktorial *= i;
    }
  }
  //kembalikan haasil perkalian dari perulangan
  return faktorial;
}

//fungsi utama
void main() {
  //menampilkan menu yang bisa dipilih
  print("Silahkan Pilih Menu");
  print("1. Hitung Grade");
  print("2. Faktorial");

  //menampilkan teks memilih menu
  stdout.write("Pilih Menu : ");
  //membuat inputan memilih menu
  int menu = int.parse(stdin.readLineSync()!);

  //melakukan kondisi dari menu yang diinput
  switch (menu) {
    //menu yang dipilih 1
    case 1:
      {
        //maka tampilkan perintah berikut ini
        stdout.write("Masukkan Nilai (angka 0-100) : ");
        //inputan sesuai perintah diatas.
        double nilai = double.parse(stdin.readLineSync()!);
        //memanggil fungsi Grade dengan parameter sesuai inputan, dan cetak hasil returnnya.
        print("Nilai Anda : " + Grade(nilai));
      }
      break;
    //menu yang dipilih 2
    case 2:
      {
        //maka tampilkan perintah berikut ini
        stdout.write("Masukkan Angka Minimum 0 : ");
        //inputan sesuai perintah diatas.
        double angka = double.parse(stdin.readLineSync()!);
        //memanggil fungsi faktorial dengan parameter sesuai inputan, dan cetak hasil returnnya.
        print(Faktorial(angka));
      }
      break;
    //jika pilihan menu yang diinput bukan dari dua case diatas
    default:
      {
        {
          //tampilkan invalid choice
          print("Invalid choice");
        }
      }
      break;
  }
}
