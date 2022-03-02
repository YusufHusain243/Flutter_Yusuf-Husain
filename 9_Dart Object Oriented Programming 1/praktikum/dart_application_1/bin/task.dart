import 'dart:io';

//membuat class hewan
class Hewan {
  //membuat property list data hewan sebagai penampung data hewan
  List dataHewan = [];

  //membuat method tambah hewan dengan parameter nama dan berat hewan
  //method ini berfungsi untuk menambah data hewan ke property data hewab
  void tambahHewan(String? namaHewan, var berat) {
    //menamba data hewan ke list data hewan
    dataHewan.add(
      //data berbentuk map
      {"$namaHewan": berat},
    );
    print("Berhasil Ditambah\n==============================");
  }

  //membuat method menampilkan data hewan
  void tampilkanDataHewan() {
    //membuat perulangan pertama untuk melihat semua list yang ada
    for (var i = 0; i < dataHewan.length; i++) {
      //setiap index pada list dimasukkan ke variabel temp
      var temp = dataHewan[i];
      //membuat perulangan untuk melihat data dari map temp
      for (var detailHewan in temp.keys) {
        //membuat variabel nama hewan sebagai penampung nama hewan (key dari map temp)
        var namaHewan = detailHewan;
        //membuat variabel berat hewan sebagai penampung berat hewan (value dari map temp)
        var beratHewan = temp[detailHewan];
        //membuat index sebagai nomor daftar hewan
        var index = i + 1;
        print(
            "$index. $namaHewan = $beratHewan KG\n==============================");
      }
    }
  }
}

//membuat class mobil
class Mobil {
  //membuat list data mobil sebagai penampung data mobil
  var dataMobil = [];
  //membuat list muatan sebagai penampung data muatan mobil
  var muatan = [];

  //membuat method tambah mobil dengan parameter nama dan kapasitas mobil
  void tambahMobil(String? namaMobil, var kapasitas) {
    //menambah data pada list data mobil
    dataMobil.add(
      //data berbentuk map
      {"$namaMobil": kapasitas},
    );
    print("Berhasil Ditambah\n==============================");
  }

  //membuat method tampilkan data mobil
  void tampilkanDataMobil() {
    //membuat perulangan pertama untuk melihat semua list yang ada
    for (var i = 0; i < dataMobil.length; i++) {
      //setiap index pada list dimasukkan ke variabel temp
      var temp = dataMobil[i];
      //membuat perulangan untuk melihat data dari map temp
      for (var detailMobil in temp.keys) {
        //membuat variabel nama mobil sebagai penampung nama mobil (key dari map temp)
        var namaMobil = detailMobil;
        //membuat variabel kapasitas mobil sebagai penampung kapasitas mobil (value dari map temp)
        var kapasitasMobil = temp[detailMobil];
        //membuat index sebagai nomor daftar hewan
        var index = i + 1;
        print(
            "$index. $namaMobil = $kapasitasMobil KG\n==============================");
      }
    }
  }

  //membuat method tambah muatan dengan parameter jenis mobil dan data hewan
  void tambahMuatan(int jenisMobil, var hewan) {
    //membuat variabel kapasitas mobil
    var kapasitas;
    //membuat variabel berat hewan
    int beratHewan = 0;

    //membuat perulangan untuk melihat kapasitas mobil yang dipilih
    for (var m in dataMobil[jenisMobil].keys) {
      //memasukkan kapasitas mobil ke variabel kapasitas
      kapasitas = dataMobil[jenisMobil][m];
    }

    //membuat perulangan untuk melihat list hewan yang dimuat
    for (var i = 0; i < hewan.length; i++) {
      //membuat perulangan untuk melihat berat masing masing hewan yang dimuat
      for (var dataHewan in hewan[i].keys) {
        //setiap berat hewan di masukkan ke variabel temp;
        int temp = hewan[i][dataHewan];
        //setiap terjadi perulangan menambahkan semua data hewan satu per satu
        beratHewan += temp;
      }
    }

    //melakukan pengecekan kapasitas
    //jika kapasitas melebih berat hewan
    if (kapasitas > beratHewan) {
      //maka melakukan penambahan muatan
      muatan.add({
        dataMobil[jenisMobil]: {
          'muatan': hewan,
        },
      });
      //jika kapasitas kurang dari muatan
    } else {
      //maka cetak melebihi kapasitas
      print("Melebihi Kapasitas");
    }
  }

  //membuat metod total muatan
  //method ini bertujuan untuk melihat total muatan masing masing mobil
  void totalMuatan() {
    //inisialisasi variabel berat
    int berat = 0;
    //membuat perulangan untuk melihat list muatan
    for (var i = 0; i < muatan.length; i++) {
      //membuat perulangan untuk melihat data muatan
      for (var jenisMobil in muatan[i].keys) {
        //memanggil method hitung total dan dimasukkan ke variabel temp
        var temp = (hitungTotal(muatan[i][jenisMobil]));
        //membuat perulangan untuk melihat data mobil
        for (var dataMobil in jenisMobil.keys) {
          //cetak nama dan muatan yang dibawa oleh sebuah mobil
          print(
              "\n====================\nMobil $dataMobil Muatan = $temp\n====================\n");
        }
      }
    }
  }

  // membuat method dengan tipe int dan dengan parameter data
  int hitungTotal(var data) {
    //inisialisasi total
    int total = 0;
    //membuat perulangan untuk melihat data muatan
    for (var dataMuatan in data.keys) {
      //membuat perulangab untuk melihat list yang ada di data muatan
      for (var i = 0; i < data[dataMuatan].length; i++) {
        //membuat perulangan untuk melihat berat hewan
        for (var beratHewan in data[dataMuatan][i].entries) {
          //membuat variabel temp sebagai penampung berat hewan
          int temp = beratHewan.value;
          //setiap terjadi perulangan tambahkan semua data hewan
          total += temp;
          continue;
        }
      }
    }
    //balikkan total
    return total;
  }
}

//fungsi main(utama)
void main() {
  //membuat variabel hewan sebagai objek baru dari class hewan
  var hewan = Hewan();
  //membuat variabel mobil sebagai objek baru dari class mobil
  var mobil = Mobil();
  //membuat variabel exit
  var exit;

  //membuat variabel do-while
  do {
    //membuat daftar menu
    print("Menu Kelola Angkutan Hewan\n==============================");
    print("1. Tambah Hewan");
    print("2. Tampilkan Hewan");
    print("3. Tambah Mobil");
    print("4. Tampilkan Mobil");
    print("5. Tambah Angkut Hewan");
    print("6. Tampilkan Angkut Hewan");
    print("7. Exit");

    //membuat input piluh menu dimasukkan ke variabel integer(menu)
    stdout.write("Pilih Menu : ");
    int? menu = int.parse(stdin.readLineSync()!);

    //membuat switch-case variabel menu
    switch (menu) {
      //jika input 1
      case 1:
        {
          //maka memilih menu tambah data hewan
          print("Tambah Data Hewan\n==============================");

          //input nama hewan yang dimasukkan ke variabel string(hewan)
          stdout.write("Masukkan Nama Hewan : ");
          String? namaHewan = stdin.readLineSync();

          //input berat hewan yang dimasukkan ke variabel int(berat hewan)
          stdout.write("Masukkan Berat Hewan : ");
          int? beratHewan = int.parse(stdin.readLineSync()!);

          //memanggil method tambah hewan dengan parameter nama dan berat hewan
          hewan.tambahHewan(namaHewan, beratHewan);

          //exit/no? jika y maka exit dari program jika n maka lanjut program
          stdout.write("Exit?[Y/N] : ");
          exit = stdin.readLineSync();
        }
        break;
      //jika input menu 2
      case 2:
        {
          //maka memilih menu menampilkan data hewan
          print("Tampilkan Data Hewan\n==============================");

          //memanggil method tampilkan data hewan
          hewan.tampilkanDataHewan();

          //exit/no? jika y maka exit dari program jika n maka lanjut program
          stdout.write("Exit?[Y/N] : ");
          exit = stdin.readLineSync();
        }
        break;
      // jika input menu 3
      case 3:
        {
          //maka memilih menu tambah data mobil
          print("Tambah Data Mobil\n==============================");

          //input nama mobil yang dimasukkan ke dalam variabel nama mobil
          stdout.write("Masukkan Nama Mobil : ");
          String? namaMobil = stdin.readLineSync();

          //input kapasitas mobil yang dimasukkan ke dalam variabel kapasitas mobil
          stdout.write("Masukkan Kapasitas Mobil : ");
          int? kapasitasMobil = int.parse(stdin.readLineSync()!);

          //memanggil method tambah mobil dengan parameter nama dan kapasitas mobil
          mobil.tambahMobil(namaMobil, kapasitasMobil);

          //exit/no? jika y maka exit dari program jika n maka lanjut program
          stdout.write("Exit?[Y/N] : ");
          exit = stdin.readLineSync();
        }
        break;
      //jika input menu 4
      case 4:
        {
          //maka memilih menu tampilkan data mobil
          print("Tampilkan Data Mobil\n==============================");

          //memanggil method tampilkan data mobil
          mobil.tampilkanDataMobil();

          //exit/no? jika y maka exit dari program jika n maka lanjut program
          stdout.write("Exit?[Y/N] : ");
          exit = stdin.readLineSync();
        }
        break;
      //jika memilih menu 5
      case 5:
        {
          //maka memilih kelola Tambah Angkut Hewan
          print("Tambah Angkut Hewan\n==============================");

          //tampilkan daftar mobil yang tersedia dengan cara memanggil method tampilkan data mobil
          print("Daftar Mobil\n==============================");
          mobil.tampilkanDataMobil();

          //memilih mobil yang diinginkan dan dimasukkan ke variabel jenis mobil
          stdout.write("Pilih Mobil : ");
          int? jenisMobil = int.parse(stdin.readLineSync()!);

          //tampilkan daftar hewan dengan cara memanggil method tampilkan data hewan
          print("Daftar Hewan\n==============================");
          hewan.tampilkanDataHewan();

          //masukkan jumlah hewan yang akan diangkut dan dimasukkan ke variabel int banyak hewan
          stdout.write("Masukkan Banyak Hewan : ");
          int? banyakHewan = int.parse(stdin.readLineSync()!);

          //inisialisasi list data hewan
          var dataHewan = [];

          //lakukan perulangan sebanyak jumlah hewan yang akan diangkut
          for (var i = 0; i < banyakHewan; i++) {
            //memilih jenis jewan yang tersedia;
            stdout.write("Pilih Hewan : ");
            int? jenisHewan = int.parse(stdin.readLineSync()!);

            //menambah data hewan ke list data hewan dimana inputan harus dikurangi 1 agar sesuai dengan index di list data hewan
            dataHewan.add(hewan.dataHewan[jenisHewan - 1]);
          }

          //memanggil method tambah muatan, dengan paramter jenis mobil yang dikurangi 1 agar sesuai dengan index di list data mobil
          //dan parameter kedua adalah list data hewan yang akan diangkut
          mobil.tambahMuatan(jenisMobil - 1, dataHewan);

          //exit/no? jika y maka exit dari program jika n maka lanjut program
          stdout.write("Exit?[Y/N] : ");
          exit = stdin.readLineSync();
        }
        break;
      //jika input menu 6
      case 6:
        {
          //maka tampilkan data muatan dengan cara memanggil method total muatan
          mobil.totalMuatan();
        }
        break;
      //jika memilih menu 7
      case 7:
        {
          //maka exit jadi sama dengan Y dan program dihentikan
          exit = 'Y';
        }
        break;
      //jika memilih menu yang tidak ada dilist menu
      default:
        {
          {
            //maka cetak invalid choice
            print("Invalid Choice");
          }
        }
    }
    //perulangan akan terus terjadi jika exit == N dan akan berhenti jika exit = Y
  } while (exit == 'N');
}
