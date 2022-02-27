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
