# (7) Advance function-Async-Await
Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Advance function-Async-Await
1. async-await
2. 
3. 

## Task
1. buatlah sebuah fungsi dengan spesifikasi berikut:
- menerima 2 parameter, yaitu list data dan pengali
- lakukan perulangan pada list data secara asynchronous
- tiap perulangan, kalikan elemen list data dengan pengali
- return list baru yang berisi hasil proses diatas
2. buatlah sebuah list dengan spesifikasi berikut:
- tiap element nya berupa list juga
- tiap element wajib terdapat 2 data (sub-element)
buatlah sebuah map dengan menggunakan list tersebut

## Pembahasan
1. pembahasan task pertama
```dart
import 'dart:io';

//membuat fungsi future dengan tipe balikan List
//dan mempunyai 2 parameter yaitu list dan integer
Future<List> T1(List<int> listData, int pengali) async {
  //membuat variabel hasil
  int? hasil;
  //membuat variabel listdatanew
  var listDataNew = [];
  //membuat perulangan list data dengan perulangan for in
  for (var data in listData) {
    //membuat delayed 1 second
    await Future.delayed(Duration(seconds: 1), () {
      //mengalikan setiap index list dengan pengali
      hasil = data * pengali;
      //menambah hasil perkalian ke list data baru
      listDataNew.add(hasil);
      //cetak setiap hasil perkalian
      print("$data * $pengali = $hasil");
    });
  }
  //kembalikan data baru
  return listDataNew;
}

//fungsi utama
void main() async {
  //membuat list data
  var listDdata = [1, 2, 3, 4, 5];
  //cetak list data lama
  print("Data Lama : $listDdata");
  //membuat variabel list data new, dengan nilai balikan dari fungsi T1
  var listDataNew = await T1(listDdata, 2);
  //cetak hasil fungsi T1
  print("Data Baru : $listDataNew");
}
```
berikut adalah hasil output nya:


https://user-images.githubusercontent.com/74952343/156875001-c4a768f9-5b40-43e1-b85b-af18e86a896b.mp4



2. pembahasan task kedua
```dart
import 'dart:io';

//membuat fungsi dengan tipe list
List dataAnimals() {
  //membuat list of list dengan nama animals
  List<List<String>> animals = [
    //data data list
    ['Ayam', 'Bebek'],
    ['Kuda', 'Sapi']
  ];
  //kembalikan data animals
  return animals;
}

//membuat fungsi dengam tipe map
Map categoriyAnimals() {
  //membuat variabel sebagai penampung data dari List data animals;
  var animals = dataAnimals();
  //inisialisasi variabel penampung data map
  var categories = {};
  //membuat perulangan
  for (var i = 0; i < animals.length; i++) {
    //setiap indeks perulangan menjadi key dari map dan akan memasukkan data list animals ke masing masing key
    categories[i] = animals[i];
  }
  //kembalikan categories
  return categories;
}

//membuat fungsi dengan tipe void
void accessDataAnimals() {
  //membuat variabel sebagai penampung data dari List data animals;
  var animals = dataAnimals();
  //cetak list data animals
  print("List : $animals");
  //membuat perulangan dari list data animals
  for (var animal in animals) {
    //cetak setiap list nya
    print("Akses Element List : $animal");
    //membuat perulangan dari data list animal
    for (var listAnimal in animal) {
      //cetak setiap listnya
      print("Akses Element Sub-List(Sub-Element) : $listAnimal");
    }
  }
}

//membuat fungsi dengan tipe void
void accessCategoriyAnimals() {
  //membuat variabel sebagai penampung data dari map category animals;
  var categories = categoriyAnimals();
  //cetak map category
  print("Map : $categories");
  //membuat perulangan dari data category
  for (var category in categories.keys) {
    //membuat variabel penampung list data category
    var temp = categories[category];
    //cetak semua list data category
    print("Akses Element Map : $temp");
    //membuat perulangan pada setiap list data category
    for (var i = 0; i < categories[category].length; i++) {
      //membuat variabel penampung data list data category
      var temp = categories[category][i];
      //cetak semua data list data category
      print("Akses Element List Dari Map : $temp");
    }
  }
}

//fungsi utama
void main() async {
  //memanggil fungsi access data animal/list
  print("LIST\n======================================");
  accessDataAnimals();
  //memanggil fungsi access data category/map
  print("\nMAP\n=======================================");
  accessCategoriyAnimals();
}

```