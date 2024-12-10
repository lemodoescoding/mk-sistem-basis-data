INSERT INTO Universitas (U_ID, U_Nama, U_Blacklist) VALUES 
('U0001', 'ITS', 0),
('U0002', 'ITB', 0),
('U0003', 'UI', 0),
('U0004', 'UGM', 0),
('U0005', 'UNPAD', 0),
('U0006', 'UNAIR', 0),
('U0007', 'UNDIP', 0),
('U0008', 'UB', 0),
('U0009', 'UNIGA', 0),
('U0010', 'UNJ', 0);

INSERT INTO Divisi (D_ID, D_Nama) VALUES
('D0001', 'R&D'),
('D0002', 'HR'),
('D0003', 'Finance'),
('D0004', 'Marketing');

INSERT INTO Staff (S_NIK, S_Nama, S_TglLahir, S_JenisKelamin, S_Email, S_NoTelp, Divisi_D_ID) VALUES
('1234567890123457', 'Budi Santoso', '1995-01-15', 'L', 'budi.santoso@gmail.com', '628123456789', 'D0001'),
('1234567890123458', 'Citra Dewi', '1996-03-22', 'P', 'citra.dewi@gmail.com', '628123456790', 'D0002'),
('1234567890123459', 'Diana Kartika', '1997-01-11', 'P', 'diana.kartika@gmail.com', '628345678901', 'D0002'),
('1234567890123415', 'Eko Prasetyo', '1997-09-18', 'L', 'eko.prasetyo@gmail.com', '628456789012', 'D0003'),
('1234567890123461', 'Farah Nabila', '1998-04-14', 'P', 'farah.nabila@gmail.com', '628123456789', 'D0004'),
('1234567890123462', 'Galih Ramadhan', '1998-04-14', 'L', 'galih.ramadhan@gmail.com', '628234567896', 'D0004'),
('1234567890123463', 'Hani Wijayanti', '1999-07-21', 'P', 'hani.wijayanti@gmail.com', '628345678907', 'D0003'),
('1234567890123464', 'Irfan Maulana', '1985-06-27', 'L', 'irfan.maulana@gmail.com', '628123456768', 'D0002'),
('1234567890123465', 'Jelita Anggraeni', '1984-08-30', 'P', 'jelita.angg@gmail.com', '628123456789', 'D0001'),
('1234567890123466', 'Kevin Saputra', '1986-11-19', 'L', 'kevin.saputra@gmail.com', '628234567891', 'D0001');

INSERT INTO Mahasiswa (M_NIK, M_Nama, M_JenisKelamin, M_TglLahir, M_NoTelp, M_ProgramStudi, M_Status_Pendaftaran, M_Tgl_Pendaftaran, Universitas_U_ID) VALUES
('1234567890123456', 'Muhammad Dhoni', 'L', '2000-12-10', '62811123456', 'Teknik Informatika', 1, '2024-11-01 10:30:00', 'U0001'),
('1234567890112345', 'Rio bin Ashin', 'L', '2000-12-11', '62811123457', 'Teknik Mesin', 1, '2024-11-02 12:00:00', 'U0002'),
('1234567890112323', 'Liem, Arya Renggo', 'L', '2000-12-12', '62811123458', 'Teknik Industri', 1, '2024-11-04 09:45:00', 'U0003'),
('1234567890112324', 'Kemas Triaji', 'L', '2000-12-13', '62811123459', 'Teknik Informatika', 1, '2024-11-05 11:30:00','U0004'),
('1234567890112325', 'Hajendra Gabriel', 'L', '2000-12-14', '62811123460', 'Teknik Informatika', 0, '2024-11-06 13:20:00','U0005'),
('1234567890112326', 'Wahyu Erica', 'P', '2006-10-20', '62812345671', 'Kedokteran', 1, '2024-11-07 08:00:00', 'U0006'),
('1234567890112327', 'Suadi Nadya', 'P', '2006-10-21', '62812345672', 'Farmasi', 0, '2024-11-08 15:00:00', 'U0007'),
('1234567890112328', 'Puspita Lathifa', 'P', '2000-12-10', '62812345673', 'Arsitek', 1, '2024-11-09 16:30:00','U0008'),
('3275124567890111', 'Noval Rafa Hadi', 'L', '2004-05-09', '62812345674', 'Sistem Perkapalan', 1, '2024-11-10 17:45:00', 'U0009'),
('3275124567890112', 'Sarah Mumu', 'P', '2008-01-30', '62812345675', 'Farmasi', 0, '2024-11-11 10:30:00', 'U0010'),
('1234567890112346', 'Ahmad Suryanto', 'L', '2000-12-12', '62812345676', 'Teknik Informatika', 1, '2024-11-12 21:30:00', 'U0001'),
('2345678901234678', 'Fitriani Kusuma', 'P', '2000-12-13', '62812345677', 'Sistem Informasi', 1, '2024-11-13 22:30:00', 'U0002'),
('3456789012345789', 'Rani Febriani', 'P', '2000-01-15', '62812345678', 'Teknik Elektro', 1, '2024-11-14 22:30:00', 'U0003'),
('5678901234567821', 'Andi Prasetyo', 'L', '1999-10-15', '62812345679', 'Teknik Mesin', 1, '2024-11-15 23:30:00', 'U0004'),
('9012345678901997', 'Fadli Hidayat', 'L', '2002-02-18', '628123456780', 'Teknik Komputer', 1, '2024-11-16 23:30:00', 'U0005');

INSERT INTO Project (PR_ID, PR_Nama, PR_Deskripsi, Staff_S_NIK) VALUES
('PR00001', 'Sistem Rekomendasi Produk dengan Machine Learning', 'Buat aplikasi berbasis web yang menggunakan algoritma rekomendasi (seperti Collaborative Filtering atau Content-Based Filtering) untuk memberikan rekomendasi produk kepada pengguna berdasarkan preferensi mereka dan riwayat pembelian pengguna lain.', '1234567890123457'),
('PR00002', 'Aplikasi Deteksi Sentimen di Media Sosial', 'Aplikasi yang menganalisis postingan di media sosial (misalnya, Twitter atau Facebook) untuk mendeteksi sentimen (positif, negatif, atau netral) dari pengguna terhadap suatu topik menggunakan Natural Language Processing (NLP).', '1234567890123461'),
('PR00003', 'Chatbot Berbasis AI untuk Layanan Pelanggan', 'Buat chatbot yang mampu menjawab pertanyaan pelanggan secara otomatis menggunakan Natural Language Understanding (NLU) dan Machine Learning. Chatbot ini dapat mempelajari pola dari interaksi sebelumnya untuk memberikan jawaban yang lebih baik seiring waktu.', '1234567890123461'),
('PR00004', 'Sistem Pengenalan Wajah untuk Absensi', 'Aplikasi berbasis AI yang dapat mengenali wajah siswa atau karyawan dan secara otomatis mencatat kehadiran mereka. Gunakan teknologi pengenalan wajah (Face Recognition) dengan bantuan Deep Learning seperti Convolutional Neural Networks (CNN).', '1234567890123464'),
('PR00005', 'Aplikasi Prediksi Harga Saham dengan Machine Learning', 'Kembangkan sistem yang menggunakan algoritma regresi atau LSTM (Long Short-Term Memory) untuk memprediksi harga saham di masa depan berdasarkan data historis. Sistem ini dapat memberikan wawasan kepada investor untuk membuat keputusan yang lebih baik.', '1234567890123415'),
('PR00006', 'Aplikasi Pengenalan Objek untuk Penyandang Tunanetra', 'Buat aplikasi mobile yang menggunakan computer vision untuk mengenali objek di sekitar pengguna tunanetra. Aplikasi ini akan memberikan informasi audio tentang apa yang dilihat kamera menggunakan model seperti YOLO (You Only Look Once).', '1234567890123466'),
('PR00007', 'Sistem Diagnosa Penyakit dengan AI', 'Buat aplikasi yang menggunakan algoritma klasifikasi seperti Random Forest atau Support Vector Machine (SVM) untuk menganalisis data pasien (seperti gejala dan riwayat kesehatan) dan memberikan prediksi kemungkinan penyakit yang diderita pasien.', '1234567890123466'),
('PR00008', 'Aplikasi Penerjemah Suara Real-Time', 'Kembangkan aplikasi yang dapat menerjemahkan percakapan secara real-time dari satu bahasa ke bahasa lain menggunakan Speech Recognition dan Natural Language Processing. Aplikasi ini dapat digunakan untuk keperluan pariwisata atau bisnis lintas bahasa.', '1234567890123464'),
('PR00009', 'Generative Art dengan GANs (Generative Adversarial Networks)', 'Buat aplikasi yang menghasilkan karya seni digital baru secara otomatis menggunakan Generative Adversarial Networks (GANs). Model ini bisa dilatih untuk menciptakan gambar yang unik berdasarkan dataset seni atau foto yang sudah ada.', '1234567890123463'),
('PR00010', 'Aplikasi Pengoptimalan Pengemudi dengan Reinforcement Learning', 'Buat sistem AI yang dapat memberikan rute optimal kepada pengemudi menggunakan Reinforcement Learning. Aplikasi ini dapat mempelajari pola lalu lintas dan memberikan saran rute tercepat berdasarkan pengalaman dan data real-time.', '1234567890123457');

INSERT INTO Penilaian (P_ID, P_Aspek_Kedisiplinan, P_Komunikasi, P_Skill, P_Laporan) VALUES
('P000001', 8.5, 7.8, 9.2, 9.3),
('P000002', 7.2, 6.5, 8.2, 8.6),
('P000003', 9.1, 8.7, 9.5, 9.7),
('P000004', 6.8, 7.7, 8.1, 8.8),
('P000005', 8.1, 8.7, 8.7, 9.4),
('P000006', 7.5, 6.8, 7.9, 8.3),
('P000007', 9.2, 8.5, 9.2, 9.0),
('P000008', 6.5, 7.3, 7.9, 8.2),
('P000009', 8.8, 8.1, 9.1, 9.8),
('P000010', 7.1, 6.5, 8.8, 8.9),
('P000011', 8.1, 8.5, 8.7, 9.2),
('P000012', 9.1, 8.5, 9.2, 9.4);

INSERT INTO Magang (MG_ID, MG_Tgl_Magang, Penilaian_P_ID, Mahasiswa_M_NIK, Project_PR_ID) VALUES
('MG0001', '2025-01-01', 'P000001', '1234567890123456', 'PR00001'),
('MG0002', '2025-01-02', 'P000002', '1234567890112345', 'PR00010'),
('MG0003', '2025-01-02', 'P000003', '1234567890112323', 'PR00003'),
('MG0004', '2025-01-03', 'P000004', '1234567890112324', 'PR00005'),
('MG0005', '2025-01-04', 'P000005', '1234567890112326', 'PR00006'),
('MG0006', '2025-01-05', 'P000006', '1234567890112328', 'PR00009'),
('MG0007', '2025-01-06', 'P000007', '3275124567890111', 'PR00008'),
('MG0008', '2025-01-07', 'P000008', '1234567890112346', 'PR00004'),
('MG0009', '2025-01-08', 'P000009', '2345678901234678', 'PR00002'),
('MG0010', '2025-01-08', 'P000010', '3456789012345789', 'PR00007'),
('MG0011', '2025-01-09', 'P000011', '5678901234567821', 'PR00010'),
('MG0012', '2025-01-10', 'P000012',  '9012345678901997', 'PR00001');
