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
![add_contact](https://user-images.githubusercontent.com/74952343/164269172-76bc2dea-96c1-4eee-b9b1-669d041fa31a.png)
![contact_api](https://user-images.githubusercontent.com/74952343/164269201-68d5a35d-89df-44d1-b9c0-5f95bb669656.png)
![contact_model](https://user-images.githubusercontent.com/74952343/164269220-865c0226-de40-4308-9917-4e80ac837db7.png)
![contact_screen](https://user-images.githubusercontent.com/74952343/164269263-0fdcaa38-7058-45e4-8fcd-97be76c6c328.png)
![contact_view_model](https://user-images.githubusercontent.com/74952343/164269279-b57ac9f1-6be1-4e91-a736-d74cc60aab0e.png)
![detail_contact_screen](https://user-images.githubusercontent.com/74952343/164269291-2e1510e1-04f8-43a0-bab2-d2872d6ea4a6.png)
![main](https://user-images.githubusercontent.com/74952343/164269327-81ded5be-6e27-4485-b9bd-24b60ebe40ad.png)

2. output
https://user-images.githubusercontent.com/74952343/164269208-ac30476a-49e5-472a-a43f-130409ab4f64.mp4
