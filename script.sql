CREATE DATABASE Modul2;

-- 1. - Konversi dari PDM ke SQL
-- Menggunakan RDBMS MySQL

CREATE TABLE IF NOT EXISTS Bagasi (
  ID int NOT NULL,
  Berat int,
  Ukuran varchar(5),
  Warna varchar(255),
  Jenis varchar(255),
  CONSTRAINT PK_Bagasi PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Bandara (
  ID int NOT NULL,
  Nama varchar(255),
  Kota varchar(255),
  Negara varchar(255),
  Kode_IATA char(3) NOT NULL,
  CONSTRAINT PK_Bandara PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Maskapai (
  ID char(6) NOT NULL,
  Nama varchar(255),
  Negara_Asal varchar(255),
  CONSTRAINT PK_Maskapai PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Penumpang (
  NIK char(16) NOT NULL,
  Nama varchar(255),
  tanggal_lahir date,
  Alamat varchar(255),
  No_Telepon varchar(13),
  Jenis_Kelamin char(1),
  Kewarganegaraan varchar(255),
  Bagasi_ID int,
  CONSTRAINT PK_Penumpang PRIMARY KEY (NIK),
  CONSTRAINT FK_Bagasi_ID FOREIGN KEY (Bagasi_ID) REFERENCES Bagasi(ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Pesawat (
  ID char(6) NOT NULL,
  Model varchar(255),
  Kapasitas int,
  Tahun_Produksi char(4),
  Status_Pesawat varchar(50),
  Maskapai_ID char(6),
  CONSTRAINT PK_Pesawat PRIMARY KEY (ID),
  CONSTRAINT FK_Maskapai_ID FOREIGN KEY (Maskapai_ID) REFERENCES Maskapai(ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Penerbangan (
  ID char(6) NOT NULL,
  Waktu_keberangkatan datetime,
  Waktu_sampai datetime,
  Status_penerbangan varchar(50),
  Pesawat_ID char(6),
  CONSTRAINT PK_Penerbangan PRIMARY KEY (ID),
  CONSTRAINT FK_Pesawat_ID FOREIGN KEY (Pesawat_ID) REFERENCES Pesawat(ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Tiket (
  ID char(6) NOT NULL,
  Nomor_Kursi char(3),
  Harga int,
  Waktu_pembelian datetime,
  Kelas_penerbangan varchar(50),
  Penumpang_NIK char(16),
  Penerbangan_ID char(16),
  CONSTRAINT PK_Tiket PRIMARY KEY (ID),
  CONSTRAINT FK_Penumpang_NIK FOREIGN KEY (Penumpang_NIK) REFERENCES Penumpang(NIK) 
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Penerbangan_ID FOREIGN KEY (Penerbangan_ID) REFERENCES Penerbangan(ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Bandara_Penerbangan_Intermediate (
  Bandara_ID int NOT NULL,
  Penerbangan_ID char(6) NOT NULL,
  PRIMARY KEY (Bandara_ID, Penerbangan_ID),
  CONSTRAINT FK_Bandara_Penerbangan_ID FOREIGN KEY (Bandara_ID) REFERENCES Bandara(ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Penerbangan_Bandara_ID FOREIGN KEY (Penerbangan_ID) REFERENCES Penerbangan(ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Insert data ke masing-masing tabel sesuai yang di pdf

INSERT INTO Bandara (ID, Nama, Kota, Negara, Kode_IATA)
  VALUES
  (1, 'Soekarno-Hatta', 'Jakarta', 'Indonesia', 'CGK'),
  (2, 'Ngurah Rai', 'Denpasar', 'Indonesia', 'DPS'),
  (3, 'Changi', 'Singapore', 'Singapore', 'SIN'),
  (4, 'Haneda', 'Tokyo', 'Japan', 'HND');

INSERT INTO Bagasi (ID, Berat, Ukuran, Warna, Jenis)
  VALUES
  (1, 20, 'M', 'Hitam', 'Koper'),
  (2, 15, 'S', 'Merah', 'Ransel'),
  (3, 25, 'L', 'Biru', 'Koper'),
  (4, 10, 'S', 'Hijau', 'Ransel');

INSERT INTO Maskapai (ID, Nama, Negara_Asal)
  VALUES
  ('GA123', 'Garuda Indonesia', 'Indonesia'),
  ('SQ456', 'Singapore Airlines', 'Singapore'),
  ('JL789', 'Japan Airlines', 'Japan'),
  ('QZ987', 'AirAsia', 'Malaysia');

INSERT INTO Penumpang (NIK, Nama, tanggal_lahir, Alamat, No_Telepon, Jenis_Kelamin, Kewarganegaraan, Bagasi_ID)
  VALUES
  ('3201123456789012', 'Budi Santoso', '1990-04-15', 'Jl. Merdeka No.1', '081234567890', 'L', 'Indonesia', 1),
  ('3302134567890123', 'Siti Aminah', '1985-08-20', 'Jl. Kebangsaan No.2', '081298765432', 'P', 'Indonesia', 2),
  ('3403145678901234', 'John Tanaka', '1992-12-05', 'Shibuya, Tokyo', '080123456789', 'L', 'Japan', 3),
  ('3504156789012345', 'Li Wei', '1995-03-10', 'Orchard Rd, Singapore', '0658123456789', 'L', 'Singapore', 4);

INSERT INTO Pesawat (ID, Model, Kapasitas, Tahun_Produksi, Status_Pesawat, Maskapai_ID)
  VALUES
  ('PKABC1', 'Boeing 737', 180, '2018', 'Aktif', 'GA123'),
  ('PKDEF2', 'Airbus A320', 150, '2020', 'Aktif', 'SQ456'),
  ('PKGHI3', 'Boeing', 250, '2019', 'Dalam Perawatan', 'JL789'),
  ('PKJKL4', 'Airbus A330', 280, '2021', 'Aktif', 'QZ987');

INSERT INTO Penerbangan (ID, Waktu_keberangkatan, Waktu_sampai, Status_penerbangan, Pesawat_ID)
  VALUES
  ('FL0001', '2024-12-15 10:00:00', '2024-12-15 12:30:00', 'Jadwal', 'PKABC1'),
  ('FL0002', '2024-12-16 08:00:00', '2024-12-16 10:45:00', 'Jadwal', 'PKDEF2'),
  ('FL0003', '2024-12-17 14:00:00', '2024-12-17 16:30:00', 'Ditunda', 'PKGHI3'),
  ('FL0004', '2024-12-18 18:00:00', '2024-12-18 20:30:00', 'Jadwal', 'PKJKL4');

INSERT INTO Bandara_Penerbangan_Intermediate (Bandara_ID, Penerbangan_ID)
  VALUES
  (1, 'FL0001'),
  (2, 'FL0002'),
  (3, 'FL0003'),
  (4, 'FL0004');

INSERT INTO Tiket (ID, Nomor_Kursi, Harga, Waktu_pembelian, Kelas_penerbangan, Penumpang_NIK, Penerbangan_ID)
  VALUES
  ('TIK001', '12A', 1200000, '2024-11-01 08:00:00', 'Ekonomi', '3201123456789012', 'FL0001'),
  ('TIK002', '14B', 1500000, '2024-11-02 09:30:00', 'Bisnis', '3302134567890123', 'FL0002'),
  ('TIK003', '16C', 2000000, '2024-11-03 10:15:00', 'Ekonomi', '3403145678901234', 'FL0003'),
  ('TIK004', '18D', 1000000, '2024-11-04 11:45:00', 'Ekonomi', '3504156789012345', 'FL0004');

-- 3. Menambahkan kolom baru bernama email dengan tipe data varchar di tabel Penumpang 

ALTER TABLE Penumpang
  ADD COLUMN email varchar(100);

-- 4. Mengubah tipe data kolom Jenis di tabel Bagasi menjadi varchar(50)

ALTER TABLE Bagasi
  MODIFY Jenis varchar(50);

-- 5. Menambahkan PRIMARY KEY baru di tabel Bandara yakni Kode_IATA
ALTER TABLE Bandara_Penerbangan_Intermediate
  DROP CONSTRAINT FK_Bandara_Penerbangan_ID;

ALTER TABLE Bandara_Penerbangan_Intermediate
  DROP PRIMARY KEY;

ALTER TABLE Bandara
  DROP PRIMARY KEY;

ALTER TABLE Bandara
  ADD CONSTRAINT PK_Bandara PRIMARY KEY (ID, Kode_IATA);

ALTER TABLE Bandara_Penerbangan_Intermediate
  ADD CONSTRAINT PK_Bandara_Penerbangan PRIMARY KEY (Bandara_ID, Penerbangan_ID);

ALTER TABLE Bandara_Penerbangan_Intermediate
  ADD CONSTRAINT FK_Bandara_Penerbangan_ID FOREIGN KEY (Bandara_ID) REFERENCES Bandara(ID);

-- 6. Menghapus kolom email di tabel Penumpang

ALTER TABLE Penumpang
  DROP COLUMN email;

-- 7. Update data di tabel Penerbangan dengan ID = 'FL0001' dengan data Waktu_keberangkatan dan Waktu_sampai yang baru

UPDATE Penerbangan SET
  Waktu_keberangkatan = '2024-12-15 11:00:00',
  Waktu_sampai = '2024-12-15 13:30:00'
  WHERE ID = 'FL0001';

-- 8. Update data di tabel Penumpang dengan NIK = '3302134567890123' dengan data No_Telepon yang baru sesuai di PDF

UPDATE Penumpang SET
  No_Telepon = '081223344556'
  WHERE NIK = '3302134567890123';

-- 9. Update data di tabel Pesawat dengan ID = 'PKGHI3' dengan data baru yakni status diubah menjadi 'Aktif'

UPDATE Pesawat SET
  Status_Pesawat = 'Aktif'
  WHERE ID = 'PKGHI3';

-- 10. Delete data di tabel Tiket dengan ID = 'FL0004'

DELETE FROM Tiket
  WHERE ID = 'FL0004';

-- 11. Delete data di tabel Bagasi dengan ID = 2

DELETE FROM Bagasi
  WHERE ID = 2;

-- 12. Delete semua data di tabel Penerbangan dengan nilai data Status_penerbangan= 'Ditunda'

DELETE FROM Penerbangan
  WHERE Status_penerbangan = 'Ditunda';

