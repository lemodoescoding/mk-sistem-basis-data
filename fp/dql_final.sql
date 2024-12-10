-- 1
SELECT 
    m.m_nama AS nama_mahasiswa,
    u.u_nama AS universitas,
    p.p_aspek_kedisiplinan AS kedisiplinan,
    p.p_komunikasi AS komunikasi,
    p.p_skill AS skill,
    p.p_laporan AS laporan,
    ROUND((p.p_aspek_kedisiplinan + p.p_komunikasi + p.p_skill + p.p_laporan) / 4, 2) AS rata_rata
FROM mahasiswa m
JOIN magang mg ON m.m_nik = mg.mahasiswa_m_nik
JOIN penilaian p ON mg.penilaian_p_id = p.p_id
JOIN universitas u ON m.universitas_u_id = u.u_id;

-- 2
SELECT 
    u.u_nama AS universitas,
    COUNT(m.m_nik) AS jumlah_mahasiswa,
    ROUND(AVG((p.p_aspek_kedisiplinan + p.p_komunikasi + p.p_skill + p.p_laporan) / 4), 2) AS rata_rata_kinerja
FROM universitas u
JOIN mahasiswa m ON u.u_id = m.universitas_u_id
JOIN magang mg ON m.m_nik = mg.mahasiswa_m_nik
JOIN penilaian p ON mg.penilaian_p_id = p.p_id
GROUP BY u.u_nama
ORDER BY rata_rata_kinerja DESC;

SELECT 
    u.u_nama AS universitas,
    COUNT(m.m_nik) AS jumlah_mahasiswa,
    ROUND(AVG((p.p_aspek_kedisiplinan + p.p_komunikasi + p.p_skill + p.p_laporan) / 4), 2) AS rata_rata_kinerja
FROM universitas u
JOIN mahasiswa m ON u.u_id = m.universitas_u_id
JOIN magang mg ON m.m_nik = mg.mahasiswa_m_nik
JOIN penilaian p ON mg.penilaian_p_id = p.p_id
GROUP BY u.u_nama
ORDER BY rata_rata_kinerja DESC
LIMIT 1;

-- 3
SELECT 
    u.u_nama AS universitas,
    ROUND(AVG((p.p_aspek_kedisiplinan + p.p_komunikasi + p.p_skill + p.p_laporan) / 4), 2) AS rata_rata_kinerja
FROM universitas u
JOIN mahasiswa m ON u.u_id = m.universitas_u_id
JOIN magang mg ON m.m_nik = mg.mahasiswa_m_nik
JOIN penilaian p ON mg.penilaian_p_id = p.p_id
GROUP BY u.u_nama
HAVING rata_rata_kinerja < 7.5
ORDER BY rata_rata_kinerja ASC;

SET SQL_SAFE_UPDATES = 0;

WITH temp_u_ids AS (
  SELECT u.u_id
  FROM universitas u
  JOIN mahasiswa m ON u.u_id = m.universitas_u_id
  JOIN magang mg ON m.m_nik = mg.mahasiswa_m_nik
  JOIN penilaian p ON mg.penilaian_p_id = p.p_id
  GROUP BY u.u_id
  HAVING ROUND(AVG((p.p_aspek_kedisiplinan + p.p_komunikasi + p.p_skill + p.p_laporan) / 4), 2) < 7.5
)
UPDATE universitas
SET u_blacklist = 1
WHERE u_id IN (SELECT u_id FROM temp_u_ids);

SET SQL_SAFE_UPDATES = 1;

-- 4
SELECT 
    s.s_nama AS nama_staff,
    d.d_nama AS divisi,
    COUNT(mg.mahasiswa_m_nik) AS jumlah_mahasiswa_dibimbing
FROM staff s
JOIN divisi d ON s.divisi_d_id = d.d_id
JOIN project p ON s.s_nik = p.staff_s_nik
JOIN magang mg ON p.pr_id = mg.project_pr_id
GROUP BY s.s_nik, s.s_nama, d.d_nama
ORDER BY jumlah_mahasiswa_dibimbing DESC
LIMIT 1;
