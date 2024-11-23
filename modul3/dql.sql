-- 1.
SELECT 
  p.Alumni_A_NRP, 
  a.A_Nama 
FROM Pendataan p 
JOIN Alumni a ON a.A_NRP = p.Alumni_A_NRP 
JOIN Pendataan_Kegiatan pck ON p.PD_ID = pck.Pendataan_PD_ID 
WHERE (SELECT Nama_Kg FROM Kegiatan WHERE ID_Kg = pck.Kegiatan_ID_Kg) = 'Diskusi Literasi Digital';

-- 2.
SELECT 
  COUNT(*) AS count, 
  A_ThnLulus 
FROM Alumni 
WHERE A_ThnLulus IN (2010, 2012) 
GROUP BY 
  A_ThnLulus;

-- 3.
SELECT * FROM Alumni WHERE A_NRP = (
  SELECT 
    p.Alumni_A_NRP
  FROM Pendataan p 
  JOIN Pendataan_Kegiatan pck ON p.PD_ID = pck.Pendataan_PD_ID 
  JOIN Kegiatan k ON k.ID_Kg = pck.Kegiatan_ID_Kg 
  WHERE k.ID_Kg = (SELECT ID_Kg FROM Kegiatan WHERE Nama_Kg = 'Seminar Kewirausahaan'));

-- 4.
SELECT 
  PD_ID, Admin_P_NIK 
FROM Pendataan 
WHERE PD_ID BETWEEN 'PD0010' AND 'PD0015';

-- 5.
SELECT 
  p.Admin_P_NIK, p.PD_ID 
FROM Pendataan p 
JOIN Alumni a ON p.Alumni_A_NRP = a.A_NRP 
WHERE a.A_Pekerjaan = 'Dosen';

-- 6.
SELECT 
  p.Alumni_A_NRP, 
  COUNT(pck.Kegiatan_ID_Kg) AS jml_kegiatan
FROM Pendataan p 
JOIN Alumni a ON a.A_NRP = p.Alumni_A_NRP 
JOIN Pendataan_Kegiatan pck ON p.PD_ID = pck.Pendataan_PD_ID 
GROUP BY
  pck.Pendataan_PD_ID
HAVING COUNT(pck.Kegiatan_ID_Kg) >= 2;

-- 7.
SELECT 
  ad.P_NIK,
  ad.P_Nama,
  p.PD_ID
FROM Pendataan p
JOIN Admin ad ON p.Admin_P_NIK = ad.P_NIK
JOIN Alumni a ON p.Alumni_A_NRP = a.A_NRP
WHERE a.A_Pekerjaan = 
  (SELECT A_Pekerjaan FROM Alumni WHERE A_Nama = 'Restri Amalia') 
  AND a.A_NRP <> 
  (SELECT A_NRP FROM Alumni WHERE A_Nama = 'Restri Amalia');

-- 8.
SELECT
  A_Pekerjaan AS Pekerjaan,
  COUNT(*) AS jml_alumni
FROM Alumni
GROUP BY
  A_Pekerjaan
ORDER BY jml_alumni DESC;

-- 9.
SELECT 
  p.Alumni_A_NRP, 
  COUNT(pck.Kegiatan_ID_Kg) AS jml_kegiatan
FROM Pendataan p 
JOIN Alumni a ON a.A_NRP = p.Alumni_A_NRP 
JOIN Pendataan_Kegiatan pck ON p.PD_ID = pck.Pendataan_PD_ID 
GROUP BY
  pck.Pendataan_PD_ID
ORDER BY jml_kegiatan DESC;

-- 10.
SELECT    
  ad.P_Nama AS Nama_Admin, 
  COUNT(ad.P_NIK) AS total 
FROM Admin ad 
JOIN Admin_Shift ads ON ad.P_NIK = ads.Admin_P_NIK 
WHERE ad.P_JenisKelamin = 'L'
GROUP BY 
  ads.Admin_P_NIK;
