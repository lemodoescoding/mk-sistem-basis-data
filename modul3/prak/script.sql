-- 1.
SELECT
  nama_resepsionis, usia, alamat
FROM resepsionis
WHERE jenis_kelamin = 'L'
ORDER BY usia ASC
LIMIT 1;

-- 2.
SELECT 
  p.nama_pelanggan, 
  o.jumlah_kamar, 
  GROUP_CONCAT(k.nama_kamar ORDER BY k.nama_kamar) AS nama_kamar 
FROM `order` o 
JOIN pelanggan p ON p.NIK = o.pelanggan_NIK 
JOIN order_kamar ock ON ock.order_id = o.id 
JOIN kamar k ON k.nomor = ock.kamar_nomor
WHERE p.nama_pelanggan = 'Daniel Martinez'
GROUP BY o.id;

-- 3.
SELECT 
  p.nama_resepsionis, 
  SUM(jumlah_kamar) as jml_kamar
FROM resepsionis p
JOIN `order` o ON p.id = o.resepsionis_id
GROUP BY
  p.id
HAVING jml_kamar > 2;

-- 4.
SELECT * 
FROM kamar k
WHERE k.status = 'Tersedia';

-- 5.
SELECT
  k.nomor,
  k.nama_kamar,
  k.tipe_kamar
FROM kamar k
JOIN kamar_fasilitas kcf ON kcf.kamar_nomor = k.nomor
JOIN fasilitas f ON f.id = kcf.fasilitas_id
WHERE id = (SELECT id FROM fasilitas WHERE nama = 'Wi-Fi');

-- 6.
SELECT
  COUNT(id) as jml_order,
  SUM(total_harga) AS total_pendapatan,
  AVG(total_harga) AS rata_pendapatan
FROM (
  SELECT 
  	o.id AS id,
    SUM(DATEDIFF(o.tanggal_checkout, o.tanggal_checkin) * k.harga_per_malam) AS total_harga
  FROM `order` o
  JOIN order_kamar ock ON ock.order_id = o.id
  JOIN kamar k ON ock.kamar_nomor = k.nomor
  GROUP BY
    o.id
) AS pendapatan;

-- 7.
SELECT
  p.NIK AS nik,
  p.nama_pelanggan AS nama,
  p.no_telp AS no_telp,
  k.nomor AS nomor_kamar,
  k.nama_kamar AS nama_kamar,
  k.tipe_kamar AS tipe_kamar
FROM pelanggan p
JOIN `order` o ON p.NIK = o.pelanggan_NIK
JOIN pembayaran pb ON o.id = pb.order_id
JOIN order_kamar ock ON ock.order_id = o.id
JOIN kamar k ON ock.kamar_nomor = k.nomor
WHERE pb.status = 'Belum Lunas';

-- 8.
SELECT
  k.nomor,
  k.nama_kamar,
  GROUP_CONCAT(f.nama ORDER BY f.nama) AS nama_fasilitas
FROM kamar k
JOIN kamar_fasilitas kcf ON k.nomor = kcf.kamar_nomor
JOIN fasilitas f ON f.id = kcf.fasilitas_id
WHERE tipe_kamar = 'Deluxe'
GROUP BY
  k.nomor;

-- 9.
SELECT
  f.nama AS nama_fasilitas,
  COUNT(f.nama) AS jml_penggunaan
FROM fasilitas f
JOIN kamar_fasilitas kcf ON f.id = kcf.fasilitas_id
GROUP BY
  f.nama
ORDER BY
  jml_penggunaan DESC;

-- 10.

SELECT 
 *
FROM pelanggan
WHERE NIK LIKE '12%';
