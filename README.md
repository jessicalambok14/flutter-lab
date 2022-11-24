# counter_7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Apapun widget yang dapat berubah atau dinamis adalah stateful widget. Apapun widget yang tidak dapat berubah atau statis adalah stateless widget.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Scaffold : Sebagai layar utama aplikasi
AppBar : Untuk meletakkan judul aplikasi
Center : Untuk meletakkan elemen di tengah
Column : Untuk layouting
Text : Untuk menampilkan string/kata kata
Stack : Untuk meletakkan FloatingActionButton
Positioned : Untuk memosisikan FloatingActionButton
FloatingActionButton : Untuk meng-handle tindakan

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Saat ada oerubahan status dari widget stateful, kita menggunakan setState() untuk melakukan pembuatan ulang widget dan semua turunannya. Variabel _counter dan widget widget yang menggunakannya

4. Jelaskan perbedaan antara const dengan final.

Const saat sebelum run akan sudah dikunci valuenya, sedangkan Final akan mengunci value saat sudah di run

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

- Melakukan flutter create
- Membuat FAB tambahan untuk decrement
- Membuat method _decrement dan set method tersebut sebagai aksi dari FAB decrement
- Membuat kondisi dimana saat counter dimodulo 2 = 1 maka teks ganjil, dan selain itu genap
- Membuat kondisi dimana button FAB decrement hanya tampil saat _counter > 0

# Tugas 8 PBP

1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Misalkan navigation stack memiliki urutan sebagai berikut a b c. Setelah itu kita ingin routing lagi ke d. Berikut hasilnya jika menggunakan:
Navigator.push --> Hasilnya adalah a b c d (Menambahkan route baru ke dalam stack)
Navigator.pushReplacement --> Hasilnya adalah a b d (Menggantikan elemen paling atas dengan route baru)

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Card -> Untuk membentuk sebuah component Ketru seperti container dan diloop untuk tiap" data
Drawer -> Panel untuk melakukan perpindahan tampilan atau navigator
TextFormField -> Component untuk ask input text
Form -> Membuat sebuah container untuk dijadikan parent dari input input yang dideklarasikan
ListTile -> component yang didalamnya juga bisa digunakan widget
Column, Padding, Row -> positioning
DropDownButton -> Membuat fields untuk memilih input
DatePicker -> pilih tanggal
TextStyle -> Styling text
Container -> menampung beberapa komponen seperti div
TextButton -> membuat tombol berbasis text untuk trigger datepicker

3. Sebutkan jenis-jenis event yang ada pada flutter
onChanged : Akan muncul ketika widget mengalami perubahan
onPressed : Akan muncul ketika sebuah button dipencet
onSaved : Akan muncul ketika suatu form disimpan
onTap : Akan muncul ketika suatu widget dipencet
OnComplete

4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Pada dasarnya, flutter navigasi pada flutter menggunakan konsep stack. Halaman yang sedang dilihat oleh user berada di paling atas stack navigasi. Ketika ingin mengganti halaman, maka navigator bisa merubah top of stack dari stack halamannya baik melalui push (menambah halaman baru di atas stack), pop (Menghapus halaman di top of stack), dan operasi-operasi lainnya.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Membuat file drawer yang berisi route untuk masing masing class untuk counter, showBudget, atau formBudget.
Membuat file addBudget.dart untuk membuat form untuk dimasukkan kedalam List di dataBudget.
File dataBudget akan diset untuk memiliki fungsi untuk menambahkan obj paada atribut classnya untuk menampung data yang diinput.
Membuat showBudget dan melakukan loop dari dataBudget.len untuk diloop dan ditampilan sebagaimananya dengan Card view. Menggunakan ListView.Builder

# Tugas 9 PBP

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Seharusnya bisa, yaitu dengan mengonversi data json tepat setelah mengekstraknya dari url. Dari apa yang saya baca, menggunakan metode ini tidak umum atau bahkan tidak biasa, bahkan menurut dokumentasi Flutter, folder template dibuat terlebih dahulu. Jadi menurut saya tidak lebih baik daripada membuat model terlebih dahulu karena lebih sulit dibaca dan tidak efisien.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
FutureBuilder: Widget yang membuat diri sendiri berdasarkan interaksi terakhir dengan Future
ListTile: Untuk menampilkan data dalam alignment dan position yang diinginkan, serta menjalankan perintah onTap()
ListView: Untuk Membuat widget dari semua item dalam array.

3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
a. Tambahkan paket http menggunakan perintah add http pub flatter dan berikan proyek yang sedang dibangun koneksi internet dengan menambahkan beberapa baris kode ke file android/app/src/main/AndroidManifest.xml
b. Buat folder template dan buat file dart template dengan data json yang ingin kita ambil dan tampilkan. Saya menggunakan situs Quicktype untuk menulis kode contoh MyWatchlist yang menyesuaikan dengan JSON yang disediakan
c. Tambahkan halaman di direktori halaman yang menampilkan data json dan buat fungsi Future yang mendapatkan data dari alamat HTTP yang diberikan dengan mendekode url ke json dan mengonversinya menjadi object WatchList
d. Tampilkan data dengan widget apa pun yang kita inginkan, saya pribadi menggunakan ListView dan ListTile untuk menampilkan data

4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Menambahkan ListTile baru yang akan dipindahkan ke halaman mywatchlist pada drawer. Menambahkan folder template dan file mywatchlist.dart yang berisi kode yang disalin dari situs quicktype berdasarkan data json yang disediakan. Menambahkan file mywatchlist_page.dart ke direktori darts yang mengambil dan menampilkan data json melalui fungsi mendatang berdasarkan url tugas Django sebelumnya. Menampilkan data json di kolom ListTile sehingga kita dapat menambahkan fungsi onTap() yang menavigasi ke halaman informasi untuk setiap watchlist saat permintaan tap diterima dengan informasi untuk setiap judul watchlist. Menambahkan file watchlistitem.dart untuk menampilkan informasi detail berdasarkan judul yang diklik. Menambahkan tombol kembali yang menyematkan file navigasi.pop (kembali ke halaman sebelumnya) ke bilah navigasi bawah sehingga posisinya tetap.
