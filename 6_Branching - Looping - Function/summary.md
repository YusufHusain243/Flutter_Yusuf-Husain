# (6) Branching - Looping - Function
Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya
## Resume Branching - Looping - Function
1. pengambilan keputusan
pengambilan keputusan ini maksudnya adlaah menentukan alur program pada kondisi tertentu. pada dasaranya ada beberapa contoh conditional, tetapi pada materi ini hanya diberikan 1 yaitu "if" atau "if else". 

if memerlukan nilai bool yaitu true or false untuk menentukan kondisi yang akan dijalankan. if juga akan menjalankan perintah jika bool adalah true. contohnya adalah
```dart
if(1 == 1){
    print(true);
}
```

if else. hampir mirip dengan if sebelumnya, namun kali ini ada tambahan "else" yang mana akan menjalankan perintah jika bool adalah false.contohnya adalah
```dart
if(1 == 1){
    print(true);
}else{
    print(false);
}
```

else if. hampir mirip dengan kedua konsep sebelumnya. yang membedakan hanyalah pada proses else if akan melakukan pengjuian pada nilai bool yang lain. dan perintah akan dijalankan jika bool adalah true. contohnya adalah
```dart
if(1 == 1){
    print(true);
}else if(2 == 2){
    print(true);
}else{
    print(false);
}
```

2. perulangan
perulangan adalah sebuah proses yang dijalankan berulang kali. ada beberapa contoh perulangan misalnya 
- for
for ini memerlukan nilai awal, diketahui berapa kali perulangan terjadi, memerlukan nilai bool, jika true perulangan dilanjutkan dan memerlukan pengubah nilai. contohnya adalah
```dart
for(var i = 0; i < 5; i+=1)
{
    print(i);
}
```

- while
pada whilw berapa kali perulangan terjadi tidak akan diketahui. while juga memerlukan nilai bool, jika true maka perulangan dilanjutkan. contohnya adalah
```dart
var i = 0;
while(i < 10){
    print(i);
    i++;
}
```

- do while
do while ini mengubah bentuk while dimana proses dijalankan minimum sekali dan akan diteruskan jika nilai bool adalah true. contohnya
```dart
var i = 0;
do{
    print(i);
    i++;
}while(i < 10);
```

- break dan continue
perulangan menggunakan nilai bool untuk lanjut atau berhenti. namun dengan break atau continue maka perulangan dapat dihentikan dengan mengabaikan nilai bool. perbedaan keduanya adalah break menghentikan seluruh proses prulangan, sedangkan continue menghentikan satu kali proses perulangan.

3. fungsi
fungsi adalah kumpulan kode yang dapat digunakan ulang. untuk membuat fungsi bisa dengan deklarasi tipe balikan lalu nama fungsi lalu parameter(optional). contohnya
```dart
//fungsi dengan tipe void dan tanpa parameter
void halo(){
    print('halo');
}
//fungsi dengan tipe void dan memiliki parameter
void halo(int i){
    print(i);
}
```

untuk menjalankan atau memanggil fungsi cukup menuliskan nama fungsinya saja dan memasukkan nilai parameter jika ada.

## task
letakkan solusi dari persoalan berikut dalam masing masing fungsi!
1. terdapat sebuah nilai:
- jika nilai > 70: return A
- jika nilai > 40: return B
- jika nilai > 0: return C
- selain itu return teks kosong
2. tampilkan nilai faktorial dari:
- 10
- 20
- 30

## pembahasan
