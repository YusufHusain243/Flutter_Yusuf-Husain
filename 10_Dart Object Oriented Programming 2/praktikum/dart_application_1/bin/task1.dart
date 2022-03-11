//membuat class bangun ruang -> super class
class BangunRuang {
  //membuat property panjang tipe integer dengan value nullable
  int? panjang;
  //membuat property lebar tipe integer dengan value nullable
  int? lebar;
  //membuat property tinggi tipe integer dengan value nullable
  int? tinggi;

  //membuat constructor class bangun ruang
  BangunRuang({this.panjang, this.lebar, this.tinggi});

  //membuat method volume dengan tipe balikan integer
  int volume() {
    //menghitung hasil volume dengan tiap variabel wajib ada value dengan cara menambahkan tanda seru
    int hasil = this.panjang! * this.lebar! * this.tinggi!;
    //balikkan hasil
    return hasil;
  }
}

//membuat class kubus inheritance dari bangun ruang
class Kubus extends BangunRuang {
  //membuat property sisi dengan tipe integer
  int? sisi;
  //membuat constructor untuk class kubus
  Kubus({this.sisi});
  //override method volume yang ada di super class
  @override
  int volume() {
    //mencari volume kubus
    int hasil = this.sisi! * this.sisi! * this.sisi!;
    //balikkan hasil
    return hasil;
  }
}

//membuat class balok inheritance dari class bangun ruang
//class ini tidal memiliki property atau pun method
class Balok extends BangunRuang {}

//fungsi utama
void main() {
  //membuat objek balok
  Balok balok = Balok();
  //membuat objek kubus dengan mengisi konstruktor dengan nilai 5
  Kubus kubus = Kubus();
  //mengisi property sisi pada class kubus dengan nilai 5
  kubus.sisi = 5;

  //mencetak fungsi volume pada class kubus
  print(kubus.volume());

  //mengisi property panjang pada class balok dengan nilai 2
  balok.panjang = 2;
  //mengisi property lebar pada class balok dengan nilai 4
  balok.lebar = 4;
  //mengisi property tinggi pada class balok dengan nilai 2
  balok.tinggi = 2;
  //mencetak fungsi volume pada class balok
  print(balok.volume());
}
