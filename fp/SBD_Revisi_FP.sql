-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-12-03 05:23:01.87

-- tables
-- Table: Divisi
CREATE TABLE Divisi (
    D_ID char(5)  NOT NULL,
    D_Nama varchar(25)  NOT NULL,
    CONSTRAINT Divisi_pk PRIMARY KEY (D_ID)
);

-- Table: Mahasiswa
CREATE TABLE Mahasiswa (
    M_NIK char(16)  NOT NULL,
    M_Nama varchar(50)  NOT NULL,
    M_JenisKelamin char(1)  NOT NULL,
    M_TglLahir date  NOT NULL,
    M_NoTelp varchar(13)  NOT NULL,
    M_ProgramStudi varchar(50)  NOT NULL,
    Universitas_U_ID char(5)  NOT NULL,
    CONSTRAINT Mahasiswa_pk PRIMARY KEY (M_NIK)
);

-- Table: Pendaftaran
CREATE TABLE Pendaftaran (
    PD_ID char(7)  NOT NULL,
    PD_Status boolean  NOT NULL,
    PD_TanggalDaftar datetime  NOT NULL,
    Divisi_D_ID char(5)  NOT NULL,
    Mahasiswa_M_NIK char(16)  NOT NULL,
    CONSTRAINT Pendaftaran_pk PRIMARY KEY (PD_ID)
);

-- Table: Penilaian
CREATE TABLE Penilaian (
    P_ID char(7)  NOT NULL,
    P_Aspek_Kedisplinan float  NOT NULL,
    P_Komunikasi float  NOT NULL,
    P_Skill float  NOT NULL,
    P_Laporan float  NOT NULL,
    Projek_Magang_PR_ID char(7)  NOT NULL,
    CONSTRAINT Penilaian_pk PRIMARY KEY (P_ID)
);

-- Table: Penugasan
CREATE TABLE Penugasan (
    PMG_ID char(7)  NOT NULL,
    PMG_Nama varchar(50)  NOT NULL,
    PMG_Deskripsi varchar(255)  NOT NULL,
    PMG_Tanggal_Mulai date  NOT NULL,
    PMG_Tanggal_Selesai date  NOT NULL,
    PMG_Status varchar(15)  NOT NULL,
    Projek_Magang_PR_ID char(7)  NOT NULL,
    CONSTRAINT Penugasan_pk PRIMARY KEY (PMG_ID)
);

-- Table: Projek_Magang
CREATE TABLE Projek_Magang (
    PR_ID char(7)  NOT NULL,
    PR_Nama varchar(50)  NOT NULL,
    PR_Deskripsi varchar(255)  NOT NULL,
    Pendaftaran_PD_ID char(7)  NOT NULL,
    Staff_S_NIK char(16)  NOT NULL,
    CONSTRAINT Projek_Magang_pk PRIMARY KEY (PR_ID)
);

-- Table: Staff
CREATE TABLE Staff (
    S_NIK char(16)  NOT NULL,
    S_Nama varchar(25)  NOT NULL,
    S_TglLahir date  NOT NULL,
    S_JenisKelamin char(1)  NOT NULL,
    S_Email varchar(50)  NOT NULL,
    S_NoTelp varchar(13)  NOT NULL,
    Divisi_D_ID char(5)  NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY (S_NIK)
);

-- Table: Universitas
CREATE TABLE Universitas (
    U_ID char(5)  NOT NULL,
    U_Nama varchar(50)  NOT NULL,
    U_Blacklist boolean  NOT NULL,
    CONSTRAINT Universitas_pk PRIMARY KEY (U_ID)
);

-- foreign keys
-- Reference: Divisi_Staff (table: Staff)
ALTER TABLE Staff ADD CONSTRAINT Divisi_Staff FOREIGN KEY Divisi_Staff (Divisi_D_ID)
    REFERENCES Divisi (D_ID);

-- Reference: Mahasiswa_Universitas (table: Mahasiswa)
ALTER TABLE Mahasiswa ADD CONSTRAINT Mahasiswa_Universitas FOREIGN KEY Mahasiswa_Universitas (Universitas_U_ID)
    REFERENCES Universitas (U_ID);

-- Reference: Pendaftaran_Divisi (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Divisi FOREIGN KEY Pendaftaran_Divisi (Divisi_D_ID)
    REFERENCES Divisi (D_ID);

-- Reference: Pendaftaran_Mahasiswa (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Mahasiswa FOREIGN KEY Pendaftaran_Mahasiswa (Mahasiswa_M_NIK)
    REFERENCES Mahasiswa (M_NIK);

-- Reference: Penilaian_Projek_Magang (table: Penilaian)
ALTER TABLE Penilaian ADD CONSTRAINT Penilaian_Projek_Magang FOREIGN KEY Penilaian_Projek_Magang (Projek_Magang_PR_ID)
    REFERENCES Projek_Magang (PR_ID);

-- Reference: Penugasan_Projek_Magang (table: Penugasan)
ALTER TABLE Penugasan ADD CONSTRAINT Penugasan_Projek_Magang FOREIGN KEY Penugasan_Projek_Magang (Projek_Magang_PR_ID)
    REFERENCES Projek_Magang (PR_ID);

-- Reference: Projek_Magang_Pendaftaran (table: Projek_Magang)
ALTER TABLE Projek_Magang ADD CONSTRAINT Projek_Magang_Pendaftaran FOREIGN KEY Projek_Magang_Pendaftaran (Pendaftaran_PD_ID)
    REFERENCES Pendaftaran (PD_ID);

-- Reference: Projek_Magang_Staff (table: Projek_Magang)
ALTER TABLE Projek_Magang ADD CONSTRAINT Projek_Magang_Staff FOREIGN KEY Projek_Magang_Staff (Staff_S_NIK)
    REFERENCES Staff (S_NIK);

-- End of file.

