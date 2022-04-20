# (24) MVVM Architecture

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume MVVM Architecture

1. MVVM akan memisahkan logic dengan tampilan(View) kedalam ViewModel. ada beberapa keuntungan jika menggunakan MVVM misalnya. jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan viewmodel yang sama, mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic, pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian
2. model adalah bentuk data yang akan digunakan, dan dibuat dalam bentuk class. data data yang dimuat, diletakkan pada property
3. viewmodel menyimpan data data dan logic yang diperlukan halaman. jika widget lain memerlukan logic yang sama dapat menggunakan viewmodel yang sama.

## Task
1. ubahlah seluruh halaman yang telah dibuat menjadi bentuk MVVM
2. Tambahkan sebuah halaman baru yang menggunakan ViewModel dari halaman lain!
## Jawaban
1. program
![main](https://user-images.githubusercontent.com/74952343/164106369-540724df-77a0-4357-a07e-b629de7075f6.png)
![detail_contact_screen](https://user-images.githubusercontent.com/74952343/164106390-8bcda402-d562-45ee-8f8d-b98795394366.png)
![contact_view_model](https://user-images.githubusercontent.com/74952343/164106402-64301a8d-be40-4c92-814f-bc02976f9e3e.png)
![contact_screen](https://user-images.githubusercontent.com/74952343/164106454-7e6cee91-f60b-42a2-9d9f-a1d6d47b1d5d.png)
![contact_model](https://user-images.githubusercontent.com/74952343/164106467-0b0bbd0b-e3af-4626-b890-d4bbd6bfbd8d.png)
![contact_api](https://user-images.githubusercontent.com/74952343/164106483-cc12c44f-8de6-4b50-97f1-30f49a0152a6.png)

2. output

https://user-images.githubusercontent.com/74952343/164106507-2ea3aa56-e127-43d9-a2f4-ff80dbab0bb6.mp4

