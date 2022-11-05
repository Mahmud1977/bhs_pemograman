CREATE TABLE mahasiswa(
	id_mahasiswa INT AUTO_INCREMENT,
	name_mahasiswa VARCHAR(100),
	ref_to_fakultas INT,
	ref_to_akreditasi INT,
	ref_to_dosen INT,
	PRIMARY KEY (id_mahasiswa)
);

CREATE TABLE dosen(
	id_dosen INT AUTO_INCREMENT,
	nama_dosen VARCHAR(255),
	ref_to_mhs INT,
	ref_to_fakultas INT,
	ref_to_akreditasi INT,
	PRIMARY KEY (id_dosen)
);

CREATE TABLE akreditasi(
	id_akreditasi INT AUTO_INCREMENT,
	nama_akreditasi VARCHAR(100),
	ref_to_fakultas INT,
	PRIMARY KEY (id_akreditasi)
);

CREATE TABLE fakultas(
	id_fakultas INT AUTO_INCREMENT,
	nama_fakultas VARCHAR(100),
	ref_to_dosen INT,
	ref_to_mhs INT,
	ref_to_akreditasi INT,
	PRIMARY KEY (id_fakultas)
);

CREATE TABLE mata_kuliah(
	id_matkul INT AUTO_INCREMENT,
	nama_matakuliah VARCHAR(100),
	ref_to_mhs INT,
	ref_to_fakultas INT,
	ref_to_dosen INT,
	PRIMARY KEY (id_matkul)
);


INSERT INTO mahasiswa(nama,ref_to_dos,ref_to_fakultas,ref_to_akreditasi) VALUES('John',1,1,1);

INSERT INTO dosen(nama_dosen,ref_to_mhs,ref_to_fakultas,ref_to_akreditasi) VALUES(876,1,1,1);

INSERT INTO mata_kuliah(kd_mata_kuliah,mata_kuliah) VALUES(875,'pbo');

INSERT INTO akreditasi(nama_akreditasi) VALUES('B');

INSERT INTO fakultas(kd_fakultas,nama_fakultas) VALUES(98,'TI');

# JAWABAN 1
SELECT * FROM mahasiswa

SELECT * FROM dosen

SELECT * FROM mata_kuliah

SELECT * FROM akreditasi

SELECT * FROM fakultas

#JAWABAN 2
SELECT
	mahasiswa.id,
	mahasiswa.nama,
	mahasiswa.nim,
	mahasiswa.jenis_kelamin,
	fakultas.kd_fakultas,
	fakultas.nama_fakultas
FROM
	mahasiswa
	INNER JOIN 
	fakultas
WHERE 
	mahasiswa.ref_to_fakultas = fakultas.id
	
#JAWABAN 3
SELECT
	mahasiswa.id,
	mahasiswa.nama,
	mahasiswa.nim,
	mahasiswa.jenis_kelamin,
	fakultas.kd_fakultas,
	fakultas.nama_fakultas,
	akreditasi.nama_akreditasi
FROM
	mahasiswa
	INNER JOIN 
	fakultas,akreditasi
WHERE 
	mahasiswa.ref_to_fakultas = fakultas.id and mahasiswa.ref_to_akreditasi = akreditasi.id
	
#JAWABAN 4

SELECT
	dosen.id_dosen,
	dosen.nama_dosen,
	mahasiswa.nama,
	mahasiswa.nim,
	mahasiswa.jenis_kelamin
FROM
	dosen
	INNER JOIN 
	mahasiswa
WHERE 
	dosen.ref_to_mhs = mahasiswa.id
	
	
#JAWABAN 5

SELECT
	dosen.id_dosen,
	dosen.nama_dosen,
	fakultas.kd_fakultas,
	fakultas.nama_fakultas,
	akreditasi.nama_akreditasi
FROM
	dosen
	INNER JOIN 
	fakultas,akreditasi
WHERE 
	dosen.ref_to_fakultas = fakultas.id and dosen.ref_to_akreditasi = akreditasi.id


