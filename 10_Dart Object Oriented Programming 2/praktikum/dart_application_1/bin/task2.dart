//membuat class matematika
class Matematika {
  //membuat method hasil dengan parameter integer x dan y
  int hasil(int x, int y) {
    //return 0
    return 0;
  }
}

//membuat class KelipatanPersekutuanTerkecil yang merupakan interface dari class matematika
class KelipatanPersekutuanTerkecil implements Matematika {
  //meng override method hasil
  @override
  int hasil(int x, int y) {
    //inisialisasi varibel hasil
    var hasil = x;
    //lakukan perulangan sampai hasil mod dari hasil dan y adalah 0
    while (hasil % y != 0) {
      //setiap perulangan variabel ditambah x
      hasil += x;
    }
    //balikkan variabel hasil
    return hasil;
  }
}

//membuat class FaktorPersekutuanTerbesar yang merupakan interface dari class matematika
class FaktorPersekutuanTerbesar implements Matematika {
  //meng override method hasil
  @override
  int hasil(int x, int y) {
    //inisialisasi varibel hasil
    var hasil;
    //lakukan perulangan mulai dari 1 sampai x
    for (var i = 1; i <= x; i++) {
      //jika hasil mod x dan i == 0 && hasil mod y dan i == 0
      if (x % i == 0 && y % i == 0) {
        //maka hasil sama dengan i
        hasil = i;
      }
    }
    //balikkan hasil
    return hasil;
  }
}

//fungsi utama
void main() {
  //membuat objek KelipatanPersekutuanTerkecil
  KelipatanPersekutuanTerkecil kelipatanPersekutuanTerkecil =
      KelipatanPersekutuanTerkecil();
  //mencetak fungsi hasil pada class KelipatanPersekutuanTerkecil dengan parameter 10 dan 20
  print(kelipatanPersekutuanTerkecil.hasil(10, 20));

  //membuat objek FaktorPersekutuanTerbesar
  FaktorPersekutuanTerbesar faktorPersekutuanTerbesar =
      FaktorPersekutuanTerbesar();
  //mencetak fungsi hasil pada class FaktorPersekutuanTerbesar dengan parameter 10 dan 20
  print(faktorPersekutuanTerbesar.hasil(10, 20));
}
