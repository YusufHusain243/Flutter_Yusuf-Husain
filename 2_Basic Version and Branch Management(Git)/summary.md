# (2) Basic Version and Branch Management(git)
Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya
## Resume Basic Version and Branch Management(git)
1. Pada materi bagian pertama diberikan materi dengan judul introduction and instalation. dimana pada bagian ini dijelaskan tentang pengenalan versioning. mulai dari apa itu versionning sampai kepada sejarah versioning. dan juga untuk tahap selanjutnya diberikan tutorial untuk instalation salah satu versioning yaitu  git. dengan adanya versioning ini akan membuat developer lebih mudah dalam mengelola sebuah project terutama project yang dikerjakan secara tim. karena, jika tidak ada versioning, maka sudah pasti project yang dibuat akan sangat susah dikelola dan sangat susah untuk dihubungkan antara satu dan yang lainnya.
2. Pada materi bagian kedua diberikan materi dengan judul setting up dan push.pada materi ini diberikan pelaaran tentang ,ateri dasar atau syntak dasar dalam git. mulai dari git init, git remote, git clone, git add, git commit, git push, git pull, git diff,git stash dan lain lain. dimana materi dasar ini sangat penting, karena walaupun ada banyak sumber diinternet, akan tetapi masih terasa kurang lengkap dan detail. namun, pada materi alterra kali ini bisa dibilang sangat detail dan jelas sehingga akan dapat menambah pengetahun mengenai function atau syntak syntak yang ada tersebut.
3. Pada materi ketiga diberikan materi dengan judul branch and conflic. dimana pada bagian ini dijelaskan mengenai branch termasuk apa itu branch, cara membuat dan menghapus branch, berpindah branch dan lainnya. branch ini sangat penting ketika mengelola project dalam sebuah tim dimana pastinya akan ada pembagian tugas untuk setiap anggota tim. nah, dengan branch tugas yang dibagi itu dapat dikerjakan di masing masing branch misalnya featureA, featureB...featureN. sehingga, dengan adanya branch ini mempermudah dan mempercepata pekerjaan developer. namun, branch ini nantinya harus digabung kan agar bisa menjadi sebuah project final atau project utuh. sehingga didalam penggabungannya pasti akan menimbulkan conflic atau erorr. untuk menangani itu disarankan untuk menggunakan github desktop agar conflict yang terjadi dapat tervisualisasikan dengan jelas. sehingga dalama perbaikan akan menjadi lebih mudah.

Hal yang paling menarik yang bisa saya dapatkan dari materi ini adalah tentang branh management. dimana biasanya saya akan cukup kesusahan dalam mengelola sebuah project, tetapi setelah mempelaari materi ini saya mendapatkan wawasan lebih agar nantinya ketika mengelola project dapat lebih rapi dan efisien. selain itu untuk penanganan conflic juga saya mendapatkan ilmu baru. karena ternyata dalam penanganan nya sangat mudah dan simle ketika dapat tervisualisasi dengan jelas. tidak seperti biasanya yang dilakukan secara manual melewati gitbash, conflic yang terjadi tidak akan tervisualisasi dengan jelas.

## Task
1. membuat repository github<br>
untuk membuat repository di dalam github, cara nya hanya klik "new" dan isi semua field nya. untuk saya pribadi seperti berikut ini. ![membuat repository](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/2_Basic%20Version%20and%20Branch%20Management(Git)/screenshots/membuat%20repository.png)
2. implementasikan penggunaan branching yang terdiri dari master, development, feature A, dan feature B
untuk membuat branch caranya menuliskan commad git branch <nama_branch>. berikut adalah implementasinya.
- branch development
![membuat branch development](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/2_Basic%20Version%20and%20Branch%20Management(Git)/screenshots/membuat%20branch%20development.jpeg)
- branch featureA
![membuat branch featureA](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/2_Basic%20Version%20and%20Branch%20Management(Git)/screenshots/membuat%20branch%20feature%20A.jpeg)
- branch featureB
![membuat branch featureB](https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/2_Basic%20Version%20and%20Branch%20Management(Git)/screenshots/membuat%20branch%20feature%20B.jpeg)
3. implementasikan instruksi git untuk push, pull, stash dan merge<br>
Git push : untuk mengirimkan perubahan file setelah di commit ke remote repository.<br>
Perintah git pull akan mengambil commit terbaru lalu otomatis menggabungkan (merge) dengan branch yang aktif.<br>
stash ini berperan untuk menyimpan semua progress yang sudah kamu lakukan sejak commit terakhir tanpa membuat sebuah commit untuk state itu sendiri.<br>
git merge: Berfungsi untuk meleburkan dua state dari dua branch. Dalam git merge, branch sumber akan dibuatkan sebuah commit baru khusus untuk menyatakan bahwa telah terjadi merging dengan branch lain.<br>

### branch development
- git add branch development
!(https://github.com/YusufHusain243/Flutter_Yusuf-Husain/blob/main/2_Basic%20Version%20and%20Branch%20Management(Git)/screenshots/membuat%20branch%20feature%20B.jpeg)
- git commit branch development
- git push branch development
- git merge branch development ke branch main
### branch feature a
- git add branch feature a
- git commit branch feature a
- git push branch feature a
- git merge branch feature a ke branch development
### branch feature b
- git add branch feature b
- git commit branch feature b
- git push branch feature b
- git merge branch feature b ke branch development

4. implementasikan sebuah penanganan conflict di branch development ketika setelah merge dari branch featureA lalu merge dari branch featureB (conflict bisa terjadi jika kedua branch mengerjakan difile dan line code yang sama)
5. merge menggunakan no fast forward
