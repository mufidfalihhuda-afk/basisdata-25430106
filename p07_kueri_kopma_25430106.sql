-- KI-03: barang yang perlu dipesan ulang
SELECT kode_barang, nama_barang, stok_barang, stok_min_barang, 
stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_barang < stok_min_barang
ORDER BY kurang DESC;

-- Menampilkan barang kategori ATK dan minuman
SELECT kode_barang, nama_barang, kategori_barang
FROM barang
WHERE kategori_barang IN ('ATK', 'MNM');

-- Menampilkan nota pada rentang tanggal
SELECT no_nota_penjualan, tgl_penjualan
FROM penjualan
WHERE tgl_penjualan
BETWEEN '2026-09-24 10:15:00' AND '2026-11-03 20:00:47';

-- Menampilkan anggota tanpa nomor HP
SELECT nama_anggota, no_hp_anggota
FROM anggota
WHERE no_hp_anggota IS NULL;

-- Mencari anggota yang namanya mengandung huruf a
SELECT
    CONCAT(
        nama_anggota,
        ' (',
        no_anggota,
        ')'
    ) AS anggota,

    DATE_FORMAT(
        tgl_daftar_anggota,
        '%d-%m-%Y'
    ) AS tgl_daftar_anggota,

    IFNULL(no_hp_anggota, '-') AS hp,

    CASE status_anggota
        WHEN 'aktif' THEN 'Diskon 5%'
        ELSE 'Tanpa diskon'
    END AS keterangan

FROM anggota
WHERE nama_anggota LIKE '%a%'
ORDER BY tgl_daftar_anggota DESC
LIMIT 5;

-- CONCAT	        Menggabungkan nama dan nomor anggota
-- DATE_FORMAT	    Mengubah format tanggal
-- IFNULL	        Mengganti HP yang NULL menjadi -
-- CASE	            Menampilkan keterangan berdasarkan status
-- LIKE '%a%'	    Mencari nama yang mengandung huruf a
-- ORDER BY DESC	Mengurutkan dari tanggal terbaru
-- LIMIT 5	        Membatasi hasil menjadi 5 anggota

-- Menghitung lama keanggotaan anggota
SELECT
    nama_anggota,
    tgl_daftar_anggota,
    DATEDIFF(
        CURDATE(),
        tgl_daftar_anggota
    ) AS lama_hari,
    CASE
        WHEN DATEDIFF(
            CURDATE(),
            tgl_daftar_anggota
        ) < 180 THEN 'Baru'
        ELSE 'Lama'
    END AS kategori

FROM anggota;

-- DATEDIFF() menghitung selisih dua tanggal dalam hari.
-- CURDATE() mengambil tanggal hari ini.
-- CASE menentukan kategori anggota.

-- ////////////////////////////////////////////
-- Menghitung subtotal setiap barang dalam nota
SELECT id_barang,
       qty_detail_penjualan,
       harga_satuan_detail_penjualan,
       qty_detail_penjualan * harga_satuan_detail_penjualan AS subtotal
FROM detail_penjualan
WHERE id_penjualan = 2;

-- qty_detail_penjualan = jumlah barang yang dibeli.
-- harga_satuan_detail_penjualan = harga satuan barang.
-- AS subtotal = memberi nama hasil perkalian.
-- Catatan: Angka 2 merupakan id_penjualan yang sesuai dengan nota PJ-2609-0142. 