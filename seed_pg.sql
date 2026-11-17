CREATE TABLE patients (
  patient_id INTEGER PRIMARY KEY,
  full_name  TEXT NOT NULL,
  birth_year INTEGER NOT NULL CHECK (birth_year BETWEEN 1900 AND 2026),
  city       TEXT NOT NULL
);
CREATE TABLE prescribers (
  prescriber_id INTEGER PRIMARY KEY,
  full_name     TEXT NOT NULL,
  specialty     TEXT NOT NULL
);
CREATE TABLE drugs (
  drug_id      INTEGER PRIMARY KEY,
  generic_name TEXT NOT NULL UNIQUE,
  drug_class   TEXT NOT NULL,
  unit_price   NUMERIC NOT NULL CHECK (unit_price >= 0),
  stock_qty    INTEGER NOT NULL DEFAULT 0 CHECK (stock_qty >= 0)
);
CREATE TABLE prescriptions (
  rx_id         INTEGER PRIMARY KEY,
  patient_id    INTEGER NOT NULL REFERENCES patients(patient_id),
  prescriber_id INTEGER NOT NULL REFERENCES prescribers(prescriber_id),
  drug_id       INTEGER NOT NULL REFERENCES drugs(drug_id),
  quantity      INTEGER NOT NULL CHECK (quantity > 0),
  rx_date       TEXT NOT NULL
);
CREATE TABLE variants (
  variant_id     INTEGER PRIMARY KEY,
  gene           TEXT NOT NULL,
  star_allele    TEXT NOT NULL,
  rsid           TEXT UNIQUE,
  function_class TEXT NOT NULL
);
CREATE TABLE drug_gene (
  drug_id          INTEGER NOT NULL REFERENCES drugs(drug_id),
  gene             TEXT NOT NULL,
  guideline_source TEXT NOT NULL,
  PRIMARY KEY (drug_id, gene)
);
INSERT INTO patients VALUES
(1,'Amina Otieno',1958,'Kisumu'),(2,'Thabo Mokoena',1972,'Makhanda'),(3,'Lerato Dlamini',1990,'Gqeberha'),
(4,'Wanjiru Kamau',1965,'Nairobi'),(5,'Sipho Ndlovu',1949,'Makhanda'),(6,'Fatuma Hassan',1983,'Mombasa'),
(7,'Pieter Botha',1955,'Gqeberha'),(8,'Achieng Odhiambo',1997,'Kisumu'),(9,'Nomsa Zulu',1961,'Makhanda'),
(10,'Brian Mwangi',2001,'Nairobi'),(11,'Zanele Khumalo',1978,'East London'),(12,'Kiprop Cheruiyot',1969,'Eldoret');
INSERT INTO prescribers VALUES
(1,'Dr Naledi Sithole','Cardiology'),(2,'Dr James Omondi','General Practice'),
(3,'Dr Priya Naidoo','Neurology'),(4,'Dr Hannah Meyer','Gastroenterology'),(5,'Dr Samuel Kiptoo','Rheumatology');
INSERT INTO drugs VALUES
(1,'Warfarin','Anticoagulant',2.10,480),(2,'Clopidogrel','Antiplatelet',4.75,300),
(3,'Phenytoin','Antiepileptic',1.60,150),(4,'Omeprazole','Proton pump inhibitor',1.95,620),
(5,'Metformin','Antidiabetic',0.85,1200),(6,'Amlodipine','Antihypertensive',1.20,900),
(7,'Atorvastatin','Statin',3.40,40),(8,'Celecoxib','Anti-inflammatory',6.30,0),
(9,'Losartan','Antihypertensive',2.25,510);
INSERT INTO prescriptions VALUES
(1,1,1,1,30,'2026-01-12'),(2,1,1,6,30,'2026-01-12'),(3,2,2,5,60,'2026-01-20'),(4,3,2,4,28,'2026-02-03'),
(5,4,1,2,30,'2026-02-10'),(6,4,1,7,30,'2026-02-10'),(7,5,1,1,30,'2026-02-14'),(8,5,2,5,60,'2026-02-14'),
(9,6,3,3,90,'2026-03-01'),(10,7,1,2,30,'2026-03-05'),(11,7,4,4,28,'2026-03-05'),(12,8,2,4,14,'2026-03-18'),
(13,9,1,6,30,'2026-04-02'),(14,9,1,9,30,'2026-04-02'),(15,10,3,3,60,'2026-04-11'),(16,11,2,5,60,'2026-04-20'),
(17,1,1,1,30,'2026-05-12'),(18,5,1,1,30,'2026-05-15'),(19,2,2,5,60,'2026-05-20'),(20,4,1,2,30,'2026-06-09');
INSERT INTO variants VALUES
(1,'CYP2C9','*2','rs1799853','Decreased function'),(2,'CYP2C9','*3','rs1057910','No function'),
(3,'CYP2C9','*5','rs28371686','Decreased function'),(4,'CYP2C9','*6','rs9332131','No function'),
(5,'CYP2C9','*8','rs7900194','Decreased function'),(6,'CYP2C9','*11','rs28371685','Decreased function'),
(7,'CYP2C19','*2','rs4244285','No function'),(8,'CYP2C19','*3','rs4986893','No function'),
(9,'CYP2C19','*17','rs12248560','Increased function');
INSERT INTO drug_gene VALUES
(1,'CYP2C9','CPIC'),(2,'CYP2C19','CPIC'),(3,'CYP2C9','CPIC'),(4,'CYP2C19','CPIC'),(8,'CYP2C9','CPIC');
