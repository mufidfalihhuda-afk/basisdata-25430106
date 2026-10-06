# Dokumen Kebutuhan Data - Perpustakaan M MEDIA

## 1. Latar Belakang

Perpustakaan M MEDIA merupakan perpustakaan fiktif yang menyediakan layanan pengelolaan buku, anggota, peminjaman, dan pengembalian buku.

## 2. Aktor dan Proses Bisnis

| Kode  | Proses                       | Aktor     |
| ----- | ---------------------------- | --------- |
| PB-01 | Mendaftarkan anggota         | Petugas   |
| PB-02 | Mengelola buku dan eksemplar | Petugas   |
| PB-03 | Mencatat peminjaman          | Petugas   |
| PB-04 | Mencatat pengembalian        | Petugas   |
| PB-05 | Mengelola denda              | Petugas   |
| PB-06 | Membuat laporan              | Pengelola |

## 3. Dokumen Sumber

1. Formulir pendaftaran anggota.
2. Kartu/data koleksi buku.
3. Slip peminjaman.
4. Formulir pengembalian.
5. Kuitansi denda.

### Dokumen sumber fiktif: Formulir Pendaftaran Anggota

Berisi: nomor anggota, NIM, nama, alamat, nomor HP, email, tanggal daftar, dan status anggota.

## 4. Entitas Kandidat

| Entitas           | Elemen Data                                            |
| ----------------- | ------------------------------------------------------ |
| Anggota           | no anggota, NIM, nama, alamat, HP, email, status       |
| Buku              | kode, ISBN, judul, penulis, penerbit, tahun, kategori  |
| Eksemplar         | kode eksemplar, kode buku, status                      |
| Petugas           | kode, nama, peran                                      |
| Peminjaman        | nomor, anggota, petugas, tanggal pinjam, batas kembali |
| Detail Peminjaman | nomor peminjaman, eksemplar                            |
| Pengembalian      | nomor pengembalian, peminjaman, tanggal kembali        |
| Denda             | nomor denda, peminjaman, hari terlambat, jumlah        |

## 5. Aturan Bisnis

| Kode  | Aturan                                                     |
| ----- | ---------------------------------------------------------- |
| AB-01 | Nomor anggota harus unik.                                  |
| AB-02 | Hanya anggota aktif yang dapat meminjam.                   |
| AB-03 | Maksimal 9 buku dalam satu transaksi.                      |
| AB-04 | Satu eksemplar tidak boleh dipinjam dua anggota sekaligus. |
| AB-05 | Eksemplar yang tidak tersedia tidak dapat dipinjam.        |
| AB-06 | Setiap peminjaman memiliki batas pengembalian.             |
| AB-07 | Keterlambatan dikenakan denda Rp7.000 per hari.            |
| AB-08 | Pengembalian harus mengacu pada peminjaman yang tercatat.  |

## 6. Kebutuhan Informasi

| Kode  | Informasi                                       |
| ----- | ----------------------------------------------- |
| KI-01 | Daftar anggota aktif.                           |
| KI-02 | Ketersediaan buku.                              |
| KI-03 | Daftar buku yang sedang dipinjam.               |
| KI-04 | Daftar anggota yang terlambat.                  |
| KI-05 | Jumlah peminjaman dan pengembalian per periode. |

## 7. Matriks CRUD

| Proses | Anggota | Buku | Eksemplar | Petugas | Peminjaman | Pengembalian | Denda |
| ------ | ------- | ---- | --------- | ------- | ---------- | ------------ | ----- |
| PB-01  | C       |      |           | R       |            |              |       |
| PB-02  |         | C    | C         | R       |            |              |       |
| PB-03  | R       | R    | R/U       | R       | C          |              |       |
| PB-04  | R       | R    | U         | R       | U          | C            | C     |
| PB-05  | R       |      |           | R       | R          | R            | C/U   |
| PB-06  | R       | R    | R         | R       | R          | R            | R     |

## 8. Kamus Data Awal

| Elemen               | Arti                 | Penanggung Jawab |
| -------------------- | -------------------- | ---------------- |
| no_anggota           | Nomor anggota        | Petugas          |
| nim_anggota          | NIM anggota          | Petugas          |
| nama_anggota         | Nama anggota         | Petugas          |
| alamat_anggota       | Alamat anggota       | Petugas          |
| no_hp_anggota        | Nomor HP             | Petugas          |
| email_anggota        | Email                | Petugas          |
| status_anggota       | Status anggota       | Petugas          |
| kode_buku            | Kode buku            | Petugas          |
| isbn_buku            | ISBN                 | Petugas          |
| judul_buku           | Judul buku           | Petugas          |
| penulis_buku         | Penulis              | Petugas          |
| penerbit_buku        | Penerbit             | Petugas          |
| tahun_terbit         | Tahun terbit         | Petugas          |
| kategori_buku        | Kategori buku        | Petugas          |
| kode_eksemplar       | Kode eksemplar       | Petugas          |
| status_eksemplar     | Status eksemplar     | Petugas          |
| no_peminjaman        | Nomor peminjaman     | Petugas          |
| tanggal_peminjaman   | Tanggal peminjaman   | Petugas          |
| tanggal_pengembalian | Tanggal pengembalian | Petugas          |
| jumlah_denda         | Total denda          | Petugas          |

## 9. Kebutuhan Non-Fungsional

NIM 25430106:

```text
P = (06 mod 9) + 1
P = 7
```

Maka:

* Maksimal transaksi = **P + 2 = 9 buku**.
* Denda = **Rp7.000/hari**.
* Perkiraan transaksi = **40 + (5 × 7) = 75 transaksi/hari**.
* Data pribadi: NIM, alamat, nomor HP, dan email.
* Data pribadi hanya dapat diakses oleh petugas/pengelola yang berwenang.

## 10. Isu Kualitas Data

1. Nomor anggota dan NIM tidak boleh ganda.
2. Status eksemplar harus sesuai kondisi sebenarnya.
3. Buku yang sedang dipinjam tidak boleh dianggap tersedia.
4. Perhitungan denda harus sesuai jumlah hari keterlambatan.
5. Data anggota harus lengkap dan valid.
6. Data buku dan eksemplar harus dibedakan karena satu judul dapat memiliki banyak eksemplar.
