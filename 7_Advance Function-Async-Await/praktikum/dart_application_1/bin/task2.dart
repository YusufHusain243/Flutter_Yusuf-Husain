import 'dart:io';

//membuat fungsi dengan tipe list
List dataAnimals() {
  //membuat list of list dengan nama animals
  List<List> animals = [
    //data data list
    ['Ayam', 2],
    ['Kuda', 4],
  ];
  //kembalikan data animals
  return animals;
}

// membuat fungsi dengan tipe map
Map categoriyAnimals() {
  //membuat variabel sebagai penampung data dari List data animals;
  var animals = dataAnimals();
  //inisialisasi variabel penampung data map
  var categories = {};
  //membuat perulangan
  for (var i = 0; i < animals.length; i++) {
    //setiap indeks ke nol dari data list animals menjadi key dari map dan indeks pertama dari data list animals akan menjadi value
    // categories[animals[i][0]] = animals[i][1];
    for (var j = 0; j < animals[i].length; j++) {
      categories[animals[i][0]] = animals[i][1];
    }
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
  for (var category in categories.entries) {
    //cetak key map
    var temp1 = category.key;
    print("Akses Key Dari Map : $temp1");
    //cetak value map
    var temp2 = category.value;
    print("Akses Value Dari Map : $temp2");
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
