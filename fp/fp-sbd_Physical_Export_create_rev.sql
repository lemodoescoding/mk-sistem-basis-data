-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-11-26 08:42:36.709

-- tables
-- Table: Divisi
CREATE TABLE Divisi (
    D_ID char(5)  NOT NULL,
    D_Nama varchar(25)  NOT NULL,
    CONSTRAINT Divisi_pk PRIMARY KEY (D_ID)
);

-- Table: Mahasiswa
CREATE TABLE Mahasiswa (
    M_NRP char(19)  NOT NULL,
    M_nama varchar(50)  NOT NULL,
    M_JenisKelamin char(5)  NOT NULL,
    M_TglLahir date  NOT NULL,
    M_Email varchar(50)  NOT NULL,
    M_NoTelp varchar(13)  NOT NULL,
    M_ProgramStudi varchar(50)  NOT NULL,
    CONSTRAINT Mahasiswa_pk PRIMARY KEY (M_NRP)
);

-- Table: Pembimbing
CREATE TABLE Pembimbing (
    PB_ID Char  NOT NULL,
    Staff_S_NIK char(16)  NOT NULL,
    CONSTRAINT Pembimbing_pk PRIMARY KEY (PB_ID)
);

-- Table: Pendaftaran
CREATE TABLE Pendaftaran (
    PD_ID char(7)  NOT NULL,
    PD_Status boolean  NOT NULL,
    PD_TanggalDaftar datetime  NOT NULL,
    Mahasiswa_M_NRP char(19)  NOT NULL,
    Staff_S_NIK char(16)  NOT NULL,
    CONSTRAINT Pendaftaran_pk PRIMARY KEY (PD_ID)
);

-- Table: Penilaian_Magang
CREATE TABLE Penilaian_Magang (
    PG_ID int  NOT NULL,
    PG_Aspek_Kedisplinan decimal(3,2)  NOT NULL,
    PG_Komunikasi decimal(3,2)  NOT NULL,
    PG_Skill decimal(3,2)  NOT NULL,
    PG_Laporan decimal(3,2)  NOT NULL,
    Project_PR_ID char(7)  NOT NULL,
    CONSTRAINT Penilaian_Magang_pk PRIMARY KEY (PG_ID)
);

-- Table: Project
CREATE TABLE Project (
    PR_ID char(7)  NOT NULL,
    PR_Nama varchar(50)  NOT NULL,
    PR_Deskripsi varchar(255)  NOT NULL,
    Pembimbing_PB_ID Char  NOT NULL,
    Pendaftaran_PD_ID char(7)  NOT NULL,
    CONSTRAINT Project_pk PRIMARY KEY (PR_ID)
);

-- Table: Staff
CREATE TABLE Staff (
    S_NIK char(16)  NOT NULL,
    S_Nama varchar(25)  NOT NULL,
    S_JenisKelamin char(1)  NOT NULL,
    S_TglLahir date  NOT NULL,
    S_Email varchar(50)  NOT NULL,
    S_NoTelp char(50)  NOT NULL,
    Divisi_D_ID char(5)  NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY (S_NIK)
);

-- Table: Universitas
CREATE TABLE Universitas (
    U_ID char(5)  NOT NULL,
    U_Nama varchar(25)  NOT NULL,
    U_Blacklist char(1)  NOT NULL,
    Mahasiswa_M_NRP char(19)  NOT NULL,
    CONSTRAINT Universitas_pk PRIMARY KEY (U_ID)
);

-- foreign keys
-- Reference: Pembimbing_Staff (table: Pembimbing)
ALTER TABLE Pembimbing ADD CONSTRAINT Pembimbing_Staff FOREIGN KEY Pembimbing_Staff (Staff_S_NIK)
    REFERENCES Staff (S_NIK);

-- Reference: Pendaftaran_Mahasiswa (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Mahasiswa FOREIGN KEY Pendaftaran_Mahasiswa (Mahasiswa_M_NRP)
    REFERENCES Mahasiswa (M_NRP);

-- Reference: Pendaftaran_Staff (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Staff FOREIGN KEY Pendaftaran_Staff (Staff_S_NIK)
    REFERENCES Staff (S_NIK);

-- Reference: Penilaian_Magang_Project (table: Penilaian_Magang)
ALTER TABLE Penilaian_Magang ADD CONSTRAINT Penilaian_Magang_Project FOREIGN KEY Penilaian_Magang_Project (Project_PR_ID)
    REFERENCES Project (PR_ID);

-- Reference: Project_Pembimbing (table: Project)
ALTER TABLE Project ADD CONSTRAINT Project_Pembimbing FOREIGN KEY Project_Pembimbing (Pembimbing_PB_ID)
    REFERENCES Pembimbing (PB_ID);

-- Reference: Project_Pendaftaran (table: Project)
ALTER TABLE Project ADD CONSTRAINT Project_Pendaftaran FOREIGN KEY Project_Pendaftaran (Pendaftaran_PD_ID)
    REFERENCES Pendaftaran (PD_ID);

-- Reference: Staff_Divisi (table: Staff)
ALTER TABLE Staff ADD CONSTRAINT Staff_Divisi FOREIGN KEY Staff_Divisi (Divisi_D_ID)
    REFERENCES Divisi (D_ID);

-- Reference: Universitas_Mahasiswa (table: Universitas)
ALTER TABLE Universitas ADD CONSTRAINT Universitas_Mahasiswa FOREIGN KEY Universitas_Mahasiswa (Mahasiswa_M_NRP)
    REFERENCES Mahasiswa (M_NRP);

-- End of file.

