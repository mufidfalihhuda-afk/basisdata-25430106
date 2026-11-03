-- ============================================================
-- p06_data_25430106.sql
-- Proyek: Perpustakaan M MEDIA
-- NIM: 25430106
-- Modul 6: Data sampel proyek
-- Parameter unik: P = (06 MOD 9) + 1 = 7
-- Minimal transaksi utama: 10 x P = 70 baris peminjaman
-- Dapat dijalankan ulang setelah DDL p05 tersedia.
-- PERHATIAN: skrip ini mengosongkan DATA pada tabel proyek.
-- Struktur tabel tidak dihapus.
-- ============================================================

USE perpus_106;

-- Kosongkan tabel dari anak ke induk agar tidak melanggar FK.
DELETE FROM denda;
DELETE FROM pengembalian;
DELETE FROM detail_peminjaman;
DELETE FROM peminjaman;
DELETE FROM eksemplar;
DELETE FROM petugas;
DELETE FROM buku;
DELETE FROM anggota;

-- ============================================================
-- 1. ANGGOTA (5 baris)
-- ============================================================
INSERT INTO anggota
(id_anggota, no_anggota, nim_anggota, nama_anggota, alamat_anggota,
 no_hp_anggota, email_anggota, tanggal_daftar, status_anggota)
VALUES
(1, 'A001', '25430101', 'Andi Saputra', 'Jl. Melati 1', '081200000001', 'andi@email.test', '2025-01-10', 'aktif'),
(2, 'A002', '25430102', 'Bunga Lestari', 'Jl. Melati 2', '081200000002', 'bunga@email.test', '2025-02-12', 'aktif'),
(3, 'A003', '25430103', 'Citra Maharani', 'Jl. Mawar 3', '081200000003', 'citra@email.test', '2025-03-15', 'aktif'),
(4, 'A004', '25430104', 'Dedi Kurniawan', 'Jl. Kenanga 4', '081200000004', 'dedi@email.test', '2025-04-18', 'aktif'),
(5, 'A005', '25430105', 'Eka Pratama', 'Jl. Anggrek 5', '081200000005', 'eka@email.test', '2025-05-20', 'nonaktif');

-- ============================================================
-- 2. BUKU (5 baris)
-- ============================================================
INSERT INTO buku
(id_buku, kode_buku, isbn_buku, judul_buku, penulis_buku,
 penerbit_buku, tahun_terbit, kategori_buku)
VALUES
(1, 'BK001', '9786020000001', 'Basis Data Dasar', 'R. Hidayat', 'Media Ilmu', 2022, 'Teknologi'),
(2, 'BK002', '9786020000002', 'Pemrograman Web', 'S. Ananda', 'Informatika Kita', 2021, 'Teknologi'),
(3, 'BK003', '9786020000003', 'Matematika Diskrit', 'D. Purnama', 'Cerdas Press', 2020, 'Pendidikan'),
(4, 'BK004', '9786020000004', 'Algoritma dan Struktur Data', 'A. Wijaya', 'Media Ilmu', 2023, 'Teknologi'),
(5, 'BK005', '9786020000005', 'Pengantar Sistem Informasi', 'N. Permata', 'Cerdas Press', 2022, 'Teknologi');

-- ============================================================
-- 3. PETUGAS (5 baris)
-- ============================================================
INSERT INTO petugas
(id_petugas, kode_petugas, nama_petugas, peran_petugas)
VALUES
(1, 'PT001', 'Rina Amelia', 'petugas'),
(2, 'PT002', 'Bagus Setiawan', 'petugas'),
(3, 'PT003', 'Siti Rahma', 'petugas'),
(4, 'PT004', 'Fajar Nugroho', 'petugas'),
(5, 'PT005', 'Maya Putri', 'pengelola');

-- ============================================================
-- 4. EKSEMPLAR (70 baris)
-- 14 eksemplar untuk setiap judul buku.
-- EKS001-EKS035 berstatus dipinjam; EKS036-EKS070 tersedia.
-- ============================================================
INSERT INTO eksemplar (kode_eksemplar, id_buku, status_eksemplar)
VALUES
('EKS001', 1, 'dipinjam'),
('EKS002', 1, 'dipinjam'),
('EKS003', 1, 'dipinjam'),
('EKS004', 1, 'dipinjam'),
('EKS005', 1, 'dipinjam'),
('EKS006', 1, 'dipinjam'),
('EKS007', 1, 'dipinjam'),
('EKS008', 1, 'dipinjam'),
('EKS009', 1, 'dipinjam'),
('EKS010', 1, 'dipinjam'),
('EKS011', 1, 'dipinjam'),
('EKS012', 1, 'dipinjam'),
('EKS013', 1, 'dipinjam'),
('EKS014', 1, 'dipinjam'),
('EKS015', 2, 'dipinjam'),
('EKS016', 2, 'dipinjam'),
('EKS017', 2, 'dipinjam'),
('EKS018', 2, 'dipinjam'),
('EKS019', 2, 'dipinjam'),
('EKS020', 2, 'dipinjam'),
('EKS021', 2, 'dipinjam'),
('EKS022', 2, 'dipinjam'),
('EKS023', 2, 'dipinjam'),
('EKS024', 2, 'dipinjam'),
('EKS025', 2, 'dipinjam'),
('EKS026', 2, 'dipinjam'),
('EKS027', 2, 'dipinjam'),
('EKS028', 2, 'dipinjam'),
('EKS029', 3, 'dipinjam'),
('EKS030', 3, 'dipinjam'),
('EKS031', 3, 'dipinjam'),
('EKS032', 3, 'dipinjam'),
('EKS033', 3, 'dipinjam'),
('EKS034', 3, 'dipinjam'),
('EKS035', 3, 'dipinjam'),
('EKS036', 3, 'tersedia'),
('EKS037', 3, 'tersedia'),
('EKS038', 3, 'tersedia'),
('EKS039', 3, 'tersedia'),
('EKS040', 3, 'tersedia'),
('EKS041', 3, 'tersedia'),
('EKS042', 3, 'tersedia'),
('EKS043', 4, 'tersedia'),
('EKS044', 4, 'tersedia'),
('EKS045', 4, 'tersedia'),
('EKS046', 4, 'tersedia'),
('EKS047', 4, 'tersedia'),
('EKS048', 4, 'tersedia'),
('EKS049', 4, 'tersedia'),
('EKS050', 4, 'tersedia'),
('EKS051', 4, 'tersedia'),
('EKS052', 4, 'tersedia'),
('EKS053', 4, 'tersedia'),
('EKS054', 4, 'tersedia'),
('EKS055', 4, 'tersedia'),
('EKS056', 4, 'tersedia'),
('EKS057', 5, 'tersedia'),
('EKS058', 5, 'tersedia'),
('EKS059', 5, 'tersedia'),
('EKS060', 5, 'tersedia'),
('EKS061', 5, 'tersedia'),
('EKS062', 5, 'tersedia'),
('EKS063', 5, 'tersedia'),
('EKS064', 5, 'tersedia'),
('EKS065', 5, 'tersedia'),
('EKS066', 5, 'tersedia'),
('EKS067', 5, 'tersedia'),
('EKS068', 5, 'tersedia'),
('EKS069', 5, 'tersedia'),
('EKS070', 5, 'tersedia');

-- ============================================================
-- 5. PEMINJAMAN (70 baris = 10 x P)
-- Transaksi tersebar pada 3 tanggal berbeda.
-- ============================================================
INSERT INTO peminjaman
(no_peminjaman, id_anggota, id_petugas, tanggal_peminjaman, batas_pengembalian)
VALUES
(1, 1, 1, '2026-09-24', '2026-10-01'),
(2, 2, 2, '2026-09-24', '2026-10-01'),
(3, 3, 3, '2026-09-24', '2026-10-01'),
(4, 4, 4, '2026-09-24', '2026-10-01'),
(5, 5, 5, '2026-09-24', '2026-10-01'),
(6, 1, 1, '2026-09-24', '2026-10-01'),
(7, 2, 2, '2026-09-24', '2026-10-01'),
(8, 3, 3, '2026-09-24', '2026-10-01'),
(9, 4, 4, '2026-09-24', '2026-10-01'),
(10, 5, 5, '2026-09-24', '2026-10-01'),
(11, 1, 1, '2026-09-24', '2026-10-01'),
(12, 2, 2, '2026-09-24', '2026-10-01'),
(13, 3, 3, '2026-09-24', '2026-10-01'),
(14, 4, 4, '2026-09-24', '2026-10-01'),
(15, 5, 5, '2026-09-24', '2026-10-01'),
(16, 1, 1, '2026-09-24', '2026-10-01'),
(17, 2, 2, '2026-09-24', '2026-10-01'),
(18, 3, 3, '2026-09-24', '2026-10-01'),
(19, 4, 4, '2026-09-24', '2026-10-01'),
(20, 5, 5, '2026-09-24', '2026-10-01'),
(21, 1, 1, '2026-09-24', '2026-10-01'),
(22, 2, 2, '2026-09-24', '2026-10-01'),
(23, 3, 3, '2026-09-24', '2026-10-01'),
(24, 4, 4, '2026-09-24', '2026-10-01'),
(25, 5, 5, '2026-09-25', '2026-10-02'),
(26, 1, 1, '2026-09-25', '2026-10-02'),
(27, 2, 2, '2026-09-25', '2026-10-02'),
(28, 3, 3, '2026-09-25', '2026-10-02'),
(29, 4, 4, '2026-09-25', '2026-10-02'),
(30, 5, 5, '2026-09-25', '2026-10-02'),
(31, 1, 1, '2026-09-25', '2026-10-02'),
(32, 2, 2, '2026-09-25', '2026-10-02'),
(33, 3, 3, '2026-09-25', '2026-10-02'),
(34, 4, 4, '2026-09-25', '2026-10-02'),
(35, 5, 5, '2026-09-25', '2026-10-02'),
(36, 1, 1, '2026-09-25', '2026-10-02'),
(37, 2, 2, '2026-09-25', '2026-10-02'),
(38, 3, 3, '2026-09-25', '2026-10-02'),
(39, 4, 4, '2026-09-25', '2026-10-02'),
(40, 5, 5, '2026-09-25', '2026-10-02'),
(41, 1, 1, '2026-09-25', '2026-10-02'),
(42, 2, 2, '2026-09-25', '2026-10-02'),
(43, 3, 3, '2026-09-25', '2026-10-02'),
(44, 4, 4, '2026-09-25', '2026-10-02'),
(45, 5, 5, '2026-09-25', '2026-10-02'),
(46, 1, 1, '2026-09-25', '2026-10-02'),
(47, 2, 2, '2026-09-25', '2026-10-02'),
(48, 3, 3, '2026-09-26', '2026-10-03'),
(49, 4, 4, '2026-09-26', '2026-10-03'),
(50, 5, 5, '2026-09-26', '2026-10-03'),
(51, 1, 1, '2026-09-26', '2026-10-03'),
(52, 2, 2, '2026-09-26', '2026-10-03'),
(53, 3, 3, '2026-09-26', '2026-10-03'),
(54, 4, 4, '2026-09-26', '2026-10-03'),
(55, 5, 5, '2026-09-26', '2026-10-03'),
(56, 1, 1, '2026-09-26', '2026-10-03'),
(57, 2, 2, '2026-09-26', '2026-10-03'),
(58, 3, 3, '2026-09-26', '2026-10-03'),
(59, 4, 4, '2026-09-26', '2026-10-03'),
(60, 5, 5, '2026-09-26', '2026-10-03'),
(61, 1, 1, '2026-09-26', '2026-10-03'),
(62, 2, 2, '2026-09-26', '2026-10-03'),
(63, 3, 3, '2026-09-26', '2026-10-03'),
(64, 4, 4, '2026-09-26', '2026-10-03'),
(65, 5, 5, '2026-09-26', '2026-10-03'),
(66, 1, 1, '2026-09-26', '2026-10-03'),
(67, 2, 2, '2026-09-26', '2026-10-03'),
(68, 3, 3, '2026-09-26', '2026-10-03'),
(69, 4, 4, '2026-09-26', '2026-10-03'),
(70, 5, 5, '2026-09-26', '2026-10-03');

-- ============================================================
-- 6. DETAIL PEMINJAMAN (70 baris)
-- Satu eksemplar untuk setiap transaksi contoh.
-- ============================================================
INSERT INTO detail_peminjaman (no_peminjaman, kode_eksemplar)
VALUES
(1, 'EKS001'),
(2, 'EKS002'),
(3, 'EKS003'),
(4, 'EKS004'),
(5, 'EKS005'),
(6, 'EKS006'),
(7, 'EKS007'),
(8, 'EKS008'),
(9, 'EKS009'),
(10, 'EKS010'),
(11, 'EKS011'),
(12, 'EKS012'),
(13, 'EKS013'),
(14, 'EKS014'),
(15, 'EKS015'),
(16, 'EKS016'),
(17, 'EKS017'),
(18, 'EKS018'),
(19, 'EKS019'),
(20, 'EKS020'),
(21, 'EKS021'),
(22, 'EKS022'),
(23, 'EKS023'),
(24, 'EKS024'),
(25, 'EKS025'),
(26, 'EKS026'),
(27, 'EKS027'),
(28, 'EKS028'),
(29, 'EKS029'),
(30, 'EKS030'),
(31, 'EKS031'),
(32, 'EKS032'),
(33, 'EKS033'),
(34, 'EKS034'),
(35, 'EKS035'),
(36, 'EKS036'),
(37, 'EKS037'),
(38, 'EKS038'),
(39, 'EKS039'),
(40, 'EKS040'),
(41, 'EKS041'),
(42, 'EKS042'),
(43, 'EKS043'),
(44, 'EKS044'),
(45, 'EKS045'),
(46, 'EKS046'),
(47, 'EKS047'),
(48, 'EKS048'),
(49, 'EKS049'),
(50, 'EKS050'),
(51, 'EKS051'),
(52, 'EKS052'),
(53, 'EKS053'),
(54, 'EKS054'),
(55, 'EKS055'),
(56, 'EKS056'),
(57, 'EKS057'),
(58, 'EKS058'),
(59, 'EKS059'),
(60, 'EKS060'),
(61, 'EKS061'),
(62, 'EKS062'),
(63, 'EKS063'),
(64, 'EKS064'),
(65, 'EKS065'),
(66, 'EKS066'),
(67, 'EKS067'),
(68, 'EKS068'),
(69, 'EKS069'),
(70, 'EKS070');

-- ============================================================
-- 7. PENGEMBALIAN (35 baris)
-- Transaksi 36-70 sudah dikembalikan.
-- ============================================================
INSERT INTO pengembalian
(no_pengembalian, no_peminjaman, kode_eksemplar, tanggal_pengembalian)
VALUES
INSERT INTO pengembalian
(no_pengembalian, no_peminjaman, kode_eksemplar, tanggal_pengembalian)
VALUES
(1, 36, 'EKS036', '2026-10-04'),
(2, 37, 'EKS037', '2026-10-02'),
(3, 38, 'EKS038', '2026-10-02'),
(4, 39, 'EKS039', '2026-10-04'),
(5, 40, 'EKS040', '2026-10-05'),
(6, 41, 'EKS041', '2026-10-02'),
(7, 42, 'EKS042', '2026-10-04'),
(8, 43, 'EKS043', '2026-10-02'),
(9, 44, 'EKS044', '2026-10-02'),
(10, 45, 'EKS045', '2026-10-04'),
(11, 46, 'EKS046', '2026-10-02'),
(12, 47, 'EKS047', '2026-10-02'),
(13, 48, 'EKS048', '2026-10-05'),
(14, 49, 'EKS049', '2026-10-03'),
(15, 50, 'EKS050', '2026-10-06'),
(16, 51, 'EKS051', '2026-10-05'),
(17, 52, 'EKS052', '2026-10-03'),
(18, 53, 'EKS053', '2026-10-03'),
(19, 54, 'EKS054', '2026-10-05'),
(20, 55, 'EKS055', '2026-10-06'),
(21, 56, 'EKS056', '2026-10-03'),
(22, 57, 'EKS057', '2026-10-05'),
(23, 58, 'EKS058', '2026-10-03'),
(24, 59, 'EKS059', '2026-10-03'),
(25, 60, 'EKS060', '2026-10-05'),
(26, 61, 'EKS061', '2026-10-03'),
(27, 62, 'EKS062', '2026-10-03'),
(28, 63, 'EKS063', '2026-10-05'),
(29, 64, 'EKS064', '2026-10-03'),
(30, 65, 'EKS065', '2026-10-06'),
(31, 66, 'EKS066', '2026-10-05'),
(32, 67, 'EKS067', '2026-10-03'),
(33, 68, 'EKS068', '2026-10-03'),
(34, 69, 'EKS069', '2026-10-05'),
(35, 70, 'EKS070', '2026-10-06');

-- ============================================================
-- 8. DENDA (10 baris)
-- Denda hanya untuk pengembalian yang terlambat.
-- Tarif sesuai AB-07: Rp7.000 per hari.
-- ============================================================
INSERT INTO denda
(no_denda, no_pengembalian, hari_terlambat, jumlah_denda)
VALUES
(1, 1, 2, 14000.00),
(2, 4, 2, 14000.00),
(3, 5, 3, 21000.00),
(4, 7, 2, 14000.00),
(5, 10, 2, 14000.00),
(6, 13, 2, 14000.00),
(7, 15, 3, 21000.00),
(8, 16, 2, 14000.00),
(9, 19, 2, 14000.00),
(10, 20, 3, 21000.00);

-- ============================================================
-- VERIFIKASI JUMLAH DATA
-- Hasil yang diharapkan:
-- anggota 5, buku 5, petugas 5, eksemplar 70,
-- peminjaman 70, detail_peminjaman 70,
-- pengembalian 35, denda 10.
-- ============================================================
SELECT 'anggota' AS nama_tabel, COUNT(*) AS jumlah FROM anggota
UNION ALL SELECT 'buku', COUNT(*) FROM buku
UNION ALL SELECT 'petugas', COUNT(*) FROM petugas
UNION ALL SELECT 'eksemplar', COUNT(*) FROM eksemplar
UNION ALL SELECT 'peminjaman', COUNT(*) FROM peminjaman
UNION ALL SELECT 'detail_peminjaman', COUNT(*) FROM detail_peminjaman
UNION ALL SELECT 'pengembalian', COUNT(*) FROM pengembalian
UNION ALL SELECT 'denda', COUNT(*) FROM denda;

-- Verifikasi transaksi tersebar pada tiga tanggal.
SELECT tanggal_peminjaman, COUNT(*) AS jumlah_transaksi
FROM peminjaman
GROUP BY tanggal_peminjaman
ORDER BY tanggal_peminjaman;
