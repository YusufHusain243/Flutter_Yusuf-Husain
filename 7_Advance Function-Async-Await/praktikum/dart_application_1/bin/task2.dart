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
