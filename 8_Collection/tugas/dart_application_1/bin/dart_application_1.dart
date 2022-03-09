import 'dart:io';

void nomor1() {
  //soal nomor 1 -> menampilkan hello world
  print('Hello world!');
}

void nomor2() {
  //soal nomor 2 -> 5 tipe data yang bisa digunakan
  var a;
  int? b;
  double? c;
  String? d;
  const e = 1;
}

void nomor3() {
  // Buatlah variable firstName, lastName, age, height. Print hasil variable tersebut.
  var firstName = "Yusuf";
  var lastName = "Husain";
  var age = 21;
  var height = 75;

  print("$firstName $lastName Umur : $age, Berat : $height");
}

void nomor4() {
  var title = "YUSUF";
  var titleBaru = title.toLowerCase();
  print(titleBaru);
}

void nomor5() {
  var name = 'Dhimas';
  print('Yout name is $name');
  //maka hasil outputnya adalah = 'Yout name is Dhimas'
}

void nomor6() {
  // Buatlah 2 variable string, gabungkan kedua string tersebut dan print hasilnya.
  String s1 = 'Aplikasi';
  String s2 = 'Android';
  print(s1 + s2);
}

void nomor7() {
  // Sebutkan 2 properties yang bisa digunakan pada variable string dan jelaskan fungsinya.
  //ada dua properties misalnya .toUpperCase() atau .toLowerCase()
  //.toUpperCase() berguna untuk merubah string jadi huruf kapital semua
  //.toLowerCase() berguna untuk merubah string jadi huruf kecil semua
  var tes = "AssadA";
  print(tes.toLowerCase());
  print(tes.toUpperCase());
}

void nomor8() {
  // Jelaskan apa kegunaan dari toUpperCase().
  // berguna untuk memuat sebuah string menjadi huruf kapital semua
  var tes = 'aaaaa';
  print(tes.toUpperCase());
}

void nomor9() {
  int x = 1;
  int y = x++;
  int z = --y;
  print('x: $x, y: $y, z: $z');
  //hasil dari program diatas adalah
  //x: 2, y: 0, z: 0
}

void nomor10() {
  String text = 'i like pizza';
  String topping = 'with tomatoes';
  String favourite = '$text $topping'; //
  String newText = favourite.replaceAll('pizza', 'pasta');
  favourite = 'now i like curry';
  print(newText);
}

void nomor11() {
  String? nama;
  print(nama);
  //hasil dari program ini adalah null karena nama masih belum memiliki value;
}

void nomor12() {
  String number = '3';
  print(int.parse(number));
  //hasil dari program ini adalah tetap mencetak angka 3, namun yang berbeda adalah tipe datanya dirubah dari string jadi integer
}

void nomor13() {
  stdout.write("Masukkan Suhu(celcius) : ");
  int? cel = int.parse(stdin.readLineSync()!);

  var fahr = (9.0 / 5.0 * cel) + 32;
  var kel = cel + 273.15;
  var ream = cel * (4.0 / 5.0);

  print('Celcius : $cel, Fahreinheit : $fahr, Kelvin : $kel, Reamor : $ream');
}

void nomor14() {
  stdout.write("Masukkan Angka : ");
  int? angka = int.parse(stdin.readLineSync()!);
  if (angka % 2 == 0) {
    print('Genap');
  } else {
    print('Ganjil');
  }
}

void nomor15() {
  print(1 + 1); // = 2
  print(1 - 1); // = 0
  print(1 * 8); // = 8
  print(20 / 4); // = 5.0
  print(20 % 4); // = 0
}

void nomor16() {
  stdout.write("Masukkan Angka Pertama : ");
  int? angka1 = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Angka Kedua : ");
  int? angka2 = int.parse(stdin.readLineSync()!);

  print(angka1 + angka2);
  print(angka1 - angka2);
  print(angka1 / angka2);
  print(angka1 * angka2);
}

void nomor17() {
  print(1 == 2 || 1 == 1); // = true
  print(1 == 2 && 1 == 1); // = false
}

void nomor18() {
  //penerapan arrow function yang benar adalah jawaban pilihan A
  //karena arrow function itu sudah mereturn nilai balika. jadi tidak perlu menuliskan return lagi
}

void nomo19() {
  List list = [];
  Map map = {};
}

void nomor20() {
  List nums = [];
  nums.add(1);
  nums.add('dua');
  nums.add(true);

  print(nums);
  //hasilnya adalah [1,dua.true]
  //kenapa bisa seperti itu, karena pada list nya tidak dideskripsikan tipe data apa saja yang bisa dimasukkan sehingga list ini ersifat dynamic
}

void nomor21() {
  //list pada soal nomor 20 memiliki tipe data dynamic
}

void nomor22() {
  var seasons = {
    'spring': 1,
    'summer': 2,
  };

  seasons['autum'] = 3;
  print(seasons);
  //memiliki hasil yaitu
  //{spring: 1, summer: 2, autum: 3}
  //memiliki data dengan key autum karean data pada map ini ditambahkan diluar inisialisasi map nya.
}

void nomor23() {
  //tipe data map pada soal nomor 22 adalah untuk key nya memiliki tipe string dan value nya memiliki tipe integer
}

void nomor24() {
  int hasil = 0;
  List data = [1, 2, 3, 4, 5];
  for (var i = 0; i < data.length; i++) {
    hasil += i;
  }
  print(hasil);
}

void nomor25() {
  var restaurants = [
    {
      'name': 'pizza mario',
      'cuisine': 'italian',
      'rattings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'ches anne',
      'cuisine': 'french',
      'rattings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'navaratma',
      'cuisine': 'india',
      'rattings': [4.0, 4.5, 4.0],
    },
  ];

  print(restaurants[0]['name']);
}

void nomor26() {
  var restaurants = [
    {
      'name': 'pizza mario',
      'cuisine': 'italian',
      'rattings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'ches anne',
      'cuisine': 'french',
      'rattings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'navaratma',
      'cuisine': 'india',
      'rattings': [4.0, 4.5, 4.0],
    },
  ];

  var dataBaru = {
    'name': 'Yusuf',
    'cuisine': 'Indonesia',
    'rattings': [4.0, 3.5, 4.5],
  };

  restaurants.add(dataBaru);

  print(restaurants);
}

void nomor27() {
  var restaurants = [
    {
      'name': 'pizza mario',
      'cuisine': 'italian',
      'rattings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'ches anne',
      'cuisine': 'french',
      'rattings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'navaratma',
      'cuisine': 'india',
      'rattings': [4.0, 4.5, 4.0],
    },
  ];

  var dataBaru = {
    'name': 'Yusuf',
    'cuisine': 'Indonesia',
    'rattings': [4.0, 3.5, 4.5],
  };

  for (var i = 0; i < restaurants.length; i++) {
    for (var data in restaurants[i].keys) {
      print(restaurants[i][data]);
    }
  }
}

// void nomor28() {
//   var restaurants = [
//     {
//       'name': 'pizza mario',
//       'cuisine': 'italian',
//       'rattings': [4.0, 3.5, 4.5],
//     },
//     {
//       'name': 'ches anne',
//       'cuisine': 'french',
//       'rattings': [5.0, 4.5, 4.0],
//     },
//     {
//       'name': 'navaratma',
//       'cuisine': 'india',
//       'rattings': [4.0, 4.5, 4.0],
//     },
//   ];

//   var dataBaru = {
//     'name': 'Yusuf',
//     'cuisine': 'Indonesia',
//     'rattings': [4.0, 3.5, 4.5],
//   };

//   for (var i = 0; i < restaurants.length; i++) {
//     for (var data in restaurants[i].keys) {
//       var rata_rata;
//       print('Name $')
//     }
//   }
// }

Future<void> nomor29() async {
  return await Future.delayed(
    Duration(seconds: 1),
    () => print('data berhasil didapatkan'),
  );

  //hasil dari program ini adalah
  //program akan mencetak 'hello' dan setelah 1 detik program akan mencetak 'data berhasil didapatkan'
}

Future<void> nomor30() async {
  return await Future.delayed(
    Duration(seconds: 1),
    () => print('data berhasil didapatkan'),
  );

  //hasil dari program ini adalah
  //program akan mencetak 'data berhasil didapatkan' setelah 1 detik lalu program akan mencetak hello jika program ini sudah selesai
}

void main() {
  nomor9();
}
