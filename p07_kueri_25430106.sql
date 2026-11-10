-- ============================================================
-- PROYEK BASIS DATA: PERPUSTAKAAN M MEDIA
-- NIM  : 25430106
-- File : p07_kueri_25430106.sql
-- Modul: Pertemuan 7 - SELECT dan Fungsi Skalar
-- ============================================================

USE perpus_106;

-- 1===========================================================
-- KI-01: DAFTAR ANGGOTA AKTIF
-- Pertanyaan:
-- Siapa saja anggota yang masih aktif di perpustakaan?
-- Hasil yang diharapkan: Menampilkan nomor anggota, NIM, dan nama anggota yang memiliki status aktif.
-- ============================================================
SELECT
    no_anggota,
    nim_anggota,
    nama_anggota,
    status_anggota
FROM anggota
WHERE status_anggota = 'aktif';

-- 2===========================================================
-- KI-01: PENCARIAN ANGGOTA BERDASARKAN NAMA
-- Pertanyaan:
-- Siapa saja anggota yang namanya mengandung huruf 'a'?
-- Hasil yang diharapkan: Menampilkan anggota yang namanya mengandung huruf 'a'.
-- ============================================================
SELECT
    no_anggota,
    nama_anggota,
    nim_anggota
FROM anggota
WHERE nama_anggota LIKE '%a%';

-- 3===========================================================
-- KI-01: ANGGOTA TANPA NOMOR HP
-- Pertanyaan:
-- Siapa saja anggota yang belum mengisi nomor HP?
-- Hasil yang diharapkan: Menampilkan anggota yang nomor HP-nya bernilai NULL.
-- ============================================================
SELECT
    no_anggota,
    nama_anggota,
    no_hp_anggota
FROM anggota
WHERE no_hp_anggota IS NULL;

-- ============================================================
-- KI-01: KETERANGAN STATUS ANGGOTA
-- Pertanyaan:
-- Bagaimana keterangan status setiap anggota?
--
-- Hasil yang diharapkan:
-- Anggota aktif diberi keterangan 'Aktif',
-- sedangkan anggota nonaktif diberi keterangan 'Nonaktif'.
-- ============================================================
SELECT
    no_anggota,
    nama_anggota,
    CASE
        WHEN status_anggota = 'aktif' THEN 'Aktif'
        ELSE 'Nonaktif'
    END AS keterangan_status
FROM anggota;


-- ============================================================
-- KI-02: DAFTAR BUKU BERDASARKAN JUDUL
-- Pertanyaan:
-- Buku apa saja yang judulnya mengandung kata 'basis'?
--
-- Hasil yang diharapkan:
-- Menampilkan buku yang judulnya mengandung kata 'basis'.
-- Nama judul ditampilkan menggunakan huruf kapital.
-- ============================================================
SELECT
    kode_buku,
    UPPER(judul_buku) AS judul_buku,
    penulis_buku,
    kategori_buku
FROM buku
WHERE judul_buku LIKE '%basis%';


-- ============================================================
-- KI-02: DAFTAR EKSEMPLAR BERDASARKAN STATUS
-- Pertanyaan:
-- Eksemplar mana saja yang tersedia atau sedang dipinjam?
--
-- Hasil yang diharapkan:
-- Menampilkan kode eksemplar dengan status tersedia
-- atau dipinjam.
-- ============================================================

SELECT
    kode_eksemplar,
    id_buku,
    status_eksemplar
FROM eksemplar
WHERE status_eksemplar IN ('tersedia', 'dipinjam');


-- ============================================================
-- KI-03: DAFTAR DETAIL PEMINJAMAN
-- Pertanyaan:
-- Eksemplar apa saja yang tercatat dalam transaksi peminjaman?
--
-- Hasil yang diharapkan:
-- Menampilkan nomor peminjaman dan kode eksemplar
-- yang tercatat pada detail peminjaman.
--
-- CATATAN:
-- Belum dapat memastikan eksemplar masih dipinjam atau
-- sudah dikembalikan karena membutuhkan tabel pengembalian.
-- ============================================================

SELECT
    no_peminjaman,
    kode_eksemplar
FROM detail_peminjaman;


-- ============================================================
-- KI-04: PEMINJAMAN DALAM RENTANG TANGGAL
-- Pertanyaan:
-- Transaksi peminjaman apa saja yang terjadi
-- selama tahun 2026?
--
-- Hasil yang diharapkan:
-- Menampilkan transaksi peminjaman dari Januari
-- sampai Desember 2026.
-- ============================================================

SELECT
    no_peminjaman,
    id_anggota,
    tanggal_peminjaman,
    batas_pengembalian
FROM peminjaman
WHERE tanggal_peminjaman
BETWEEN '2026-01-01' AND '2026-12-31';


-- ============================================================
-- KI-04: CALON PEMINJAMAN TERLAMBAT
-- Pertanyaan:
-- Peminjaman mana saja yang batas pengembaliannya
-- sudah lewat dari tanggal hari ini?
--
-- Hasil yang diharapkan:
-- Menampilkan transaksi yang batas pengembaliannya
-- sudah terlewati dan jumlah hari sejak batas tersebut.
--
-- CATATAN:
-- Ini hanya calon keterlambatan. Belum dapat memastikan
-- anggota benar-benar terlambat karena perlu memeriksa
-- tabel pengembalian.
-- ============================================================

SELECT
    no_peminjaman,
    id_anggota,
    batas_pengembalian,
    DATEDIFF(CURDATE(), batas_pengembalian) AS hari_sejak_batas
FROM peminjaman
WHERE batas_pengembalian < CURDATE();


-- ============================================================
-- KI-05: DAFTAR PENGEMBALIAN DALAM PERIODE TERTENTU
-- Pertanyaan:
-- Pengembalian apa saja yang tercatat selama tahun 2026?
--
-- Hasil yang diharapkan:
-- Menampilkan nomor pengembalian, nomor peminjaman,
-- dan tanggal pengembalian selama tahun 2026.
-- ============================================================

SELECT
    no_pengembalian,
    no_peminjaman,
    kode_eksemplar,
    tanggal_pengembalian
FROM pengembalian
WHERE YEAR(tanggal_pengembalian) = 2026;


-- ============================================================
-- KI-04: DAFTAR DENDA
-- Pertanyaan:
-- Bagaimana keterangan denda pada setiap pengembalian?
--
-- Hasil yang diharapkan:
-- Menampilkan jumlah denda dan keterangan
-- 'Terlambat' atau 'Tidak terlambat'.
-- ============================================================

SELECT
    no_denda,
    no_pengembalian,
    hari_terlambat,
    jumlah_denda,
    CASE
        WHEN hari_terlambat > 0 THEN 'Terlambat'
        ELSE 'Tidak terlambat'
    END AS keterangan
FROM denda;


-- ============================================================
-- CATATAN KETERBATASAN KI
--
-- KI-01:
-- Dapat dijawab menggunakan satu tabel anggota.
--
-- KI-02:
-- Belum dapat menampilkan informasi ketersediaan buku
-- secara lengkap dengan nama/judul buku karena perlu
-- menghubungkan tabel buku dan eksemplar.
--
-- KI-03:
-- Belum dapat memastikan daftar buku yang masih dipinjam
-- karena perlu menghubungkan detail_peminjaman
-- dengan pengembalian.
--
-- KI-04:
-- Belum dapat memastikan daftar anggota yang benar-benar
-- terlambat karena perlu menghubungkan anggota,
-- peminjaman, dan pengembalian.
--
-- KI-05:
-- Jumlah peminjaman dan pengembalian per periode
-- membutuhkan fungsi agregat seperti COUNT dan
-- pengelompokan GROUP BY, yang akan dipelajari
-- pada pertemuan berikutnya.
--
-- ============================================================