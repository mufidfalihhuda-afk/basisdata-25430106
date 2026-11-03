INSERT INTO petugas (kode_petugas, nama_petugas, peran_petugas) VALUES
  ('K01','Dimas','kasir'), ('K02','Sari','kasir'), 
  ('K03','Rina','kasir'),
  ('G01','Joko','gudang'), ('P01','Ketua Kopma','ketua');

INSERT INTO barang (kode_barang, nama_barang, kategori_barang, 
harga_jual_barang, stok_barang, stok_min_barang) VALUES
  ('ATK-001','Pulpen Gel 0.5','ATK',4000,120,20),
  ('ATK-002','Buku Tulis 58','ATK',6500,80,20),
  ('MNM-001','Air Mineral 600','minuman',4000,48,24),
  ('MKN-001','Roti Cokelat','makanan',5000,6,10);

INSERT INTO anggota (no_anggota, nim_anggota, nama_anggota, prodi_anggota, no_hp_anggota, status_anggota, tgl_daftar_anggota) VALUES
    ('A01', '25430106', 'Mufid Falih Huda', 'Ilmu Komputer', '081011111111', 'aktif', '2026-01-01'),
    ('A02', '25430107', 'Budiono Siregar', 'Ilmu Komputer', '081022222222', 'aktif', '2026-01-02'),
    ('A03', '25430108', 'Prabowo Subianto', 'Pendidikan Matematika', '081033333333', 'nonaktif', '2026-01-03'),
    ('A04', '25430109', 'Gibran Rakabuming', 'Hukum', '081044444444', 'aktif', '2026-01-04');

INSERT INTO pemasok (kode_pemasok, nama_pemasok, telepon_pemasok, alamat_pemasok) VALUES
    ('PS01', 'PT. Jaya Abadi', '081011111111', 'Jl. Tawes'),
    ('PS02', 'CV. Makmur Sejahtera', '081022222222', 'Jl. Kemerdakaan');

INSERT INTO penjualan (no_nota_penjualan, tgl_penjualan, id_petugas, id_anggota, bayar_penjualan) VALUES 
    ('PJ-2609-0142', '2026-09-24 10:15:00', 40, 5, 30000);

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 2, id_barang, 3, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-001';

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 2, id_barang, 1, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-002';

INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 2, id_barang, 2, harga_jual_barang
FROM barang
WHERE kode_barang = 'MNM-001';



UPDATE barang
SET stok_barang = stok_barang - 3
WHERE kode_barang = 'ATK-001';

UPDATE barang
SET stok_barang = stok_barang - 1
WHERE kode_barang = 'ATK-002';

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'MNM-001';



SET SESSION sql_safe_updates = 1;
UPDATE barang SET harga_jual_barang = harga_jual_barang * 1.1; -- ditolak
UPDATE barang SET harga_jual_barang = harga_jual_barang * 1.1
WHERE kategori_barang = 'ATK' AND id_barang > 0; -- diterima


-- Membuat nota kedua untuk percobaan
INSERT INTO penjualan
(no_nota_penjualan, tgl_penjualan, id_petugas, id_anggota, bayar_penjualan) VALUES
('PJ-2609-0143', '2026-09-24 11:00:00', 3, 1, 10000);

-- Memasukkan satu barang ke nota kedua
INSERT INTO detail_penjualan
(id_penjualan, id_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT
    (SELECT id_penjualan FROM penjualan
     WHERE no_nota_penjualan = 'PJ-2609-0143'),
    id_barang, 1, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-001';

-- Menghapus nota kedua
DELETE FROM penjualan
WHERE no_nota_penjualan = 'PJ-2609-0143';


SELECT * FROM detail_penjualan
WHERE id_penjualan NOT IN (
    SELECT id_penjualan FROM penjualan
);


-- LATIHAN MODIFIKASI

CREATE TABLE anggota_arsip LIKE anggota;


INSERT INTO anggota_arsip
SELECT a.*
FROM anggota AS a
WHERE a.status_anggota = 'nonaktif'
  AND a.tgl_daftar_anggota < '2025-01-01'
  AND NOT EXISTS (
      SELECT 1
      FROM anggota_arsip AS ar
      WHERE ar.id_anggota = a.id_anggota
  );


DELETE FROM anggota
WHERE status_anggota = 'nonaktif'
  AND tgl_daftar_anggota < '2025-01-01'
  AND NOT EXISTS (
      SELECT 1
      FROM penjualan
      WHERE penjualan.id_anggota = anggota.id_anggota
  );

  SELECT * FROM anggota_arsip;

-- MEMERIKSA HASIL DELETE DARI TABEL ANGGOTA
SELECT * FROM anggota
WHERE status_anggota = 'nonaktif'
  AND tgl_daftar_anggota < '2025-01-01';

-- Menaikkan harga barang kategori makanan sebesar 5%
UPDATE barang
SET harga_jual_barang = ROUND(harga_jual_barang * 1.05, -2)
WHERE kategori_barang = 'makanan'
  AND id_barang > 0;