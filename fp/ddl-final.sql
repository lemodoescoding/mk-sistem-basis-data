DROP DATABASE IF EXISTS FP_SBD;

CREATE DATABASE FP_SBD;
USE FP_SBD;

-- Table: Universitas
CREATE TABLE Universitas (
    U_ID char(5)  NOT NULL,
    U_Nama varchar(50)  NOT NULL,
    U_Blacklist boolean  NOT NULL,
    CONSTRAINT Universitas_pk PRIMARY KEY (U_ID)
);

-- Table: Mahasiswa
CREATE TABLE Mahasiswa (
    M_NIK char(16)  NOT NULL,
    M_Nama varchar(50)  NOT NULL,
    M_JenisKelamin char(1)  NOT NULL,
    M_TglLahir date  NOT NULL,
    M_NoTelp varchar(13)  NOT NULL,
    M_ProgramStudi varchar(50)  NOT NULL,
    M_Status_Pendaftaran boolean  NOT NULL,
    M_Tgl_Pendaftaran datetime  NOT NULL,
    Universitas_U_ID char(5)  NOT NULL,
    CONSTRAINT Mahasiswa_pk PRIMARY KEY (M_NIK)
);

-- Table: Divisi
CREATE TABLE Divisi (
    D_ID char(5)  NOT NULL,
    D_Nama varchar(25)  NOT NULL,
    CONSTRAINT Divisi_pk PRIMARY KEY (D_ID)
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

-- Table: Project
CREATE TABLE Project (
    PR_ID char(7)  NOT NULL,
    PR_Nama varchar(255)  NOT NULL,
    PR_Deskripsi varchar(500)  NOT NULL,
    Staff_S_NIK char(16)  NOT NULL,
    CONSTRAINT Project_pk PRIMARY KEY (PR_ID)
);

-- Table: Penilaian
CREATE TABLE Penilaian (
    P_ID char(7)  NOT NULL,
    P_Aspek_Kedisiplinan float  NOT NULL,
    P_Komunikasi float  NOT NULL,
    P_Skill float  NOT NULL,
    P_Laporan float  NOT NULL,
    CONSTRAINT Penilaian_pk PRIMARY KEY (P_ID)
);

-- Table: Magang
CREATE TABLE Magang (
    MG_ID char(7)  NOT NULL,
    MG_Tgl_Magang date  NOT NULL,
    Penilaian_P_ID char(7)  NOT NULL,
    Staff_S_NIK char(16)  NOT NULL,
    Mahasiswa_M_NIK char(16)  NOT NULL,
    Project_PR_ID char(7)  NOT NULL,
    CONSTRAINT Magang_pk PRIMARY KEY (MG_ID)
);


-- foreign keys
-- Reference: Divisi_Staff (table: Staff)
ALTER TABLE Staff ADD CONSTRAINT Divisi_Staff FOREIGN KEY Divisi_Staff (Divisi_D_ID)
    REFERENCES Divisi (D_ID);

-- Reference: Magang_Mahasiswa (table: Magang)
ALTER TABLE Magang ADD CONSTRAINT Magang_Mahasiswa FOREIGN KEY Magang_Mahasiswa (Mahasiswa_M_NIK)
    REFERENCES Mahasiswa (M_NIK);

-- Reference: Magang_Penilaian (table: Magang)
ALTER TABLE Magang ADD CONSTRAINT Magang_Penilaian FOREIGN KEY Magang_Penilaian (Penilaian_P_ID)
    REFERENCES Penilaian (P_ID);

-- Reference: Magang_Project (table: Magang)
ALTER TABLE Magang ADD CONSTRAINT Magang_Project FOREIGN KEY Magang_Project (Project_PR_ID)
    REFERENCES Project (PR_ID);

-- Reference: Mahasiswa_Staff (table: Mahasiswa)
ALTER TABLE Mahasiswa ADD CONSTRAINT Mahasiswa_Staff FOREIGN KEY Mahasiswa_Staff (Staff_S_NIK)
    REFERENCES Staff (S_NIK);

-- Reference: Mahasiswa_Universitas (table: Mahasiswa)
ALTER TABLE Mahasiswa ADD CONSTRAINT Mahasiswa_Universitas FOREIGN KEY Mahasiswa_Universitas (Universitas_U_ID)
    REFERENCES Universitas (U_ID);

-- Reference: Projek_Magang_Staff (table: Project)
ALTER TABLE Project ADD CONSTRAINT Projek_Magang_Staff FOREIGN KEY Projek_Magang_Staff (Staff_S_NIK)
    REFERENCES Staff (S_NIK);
