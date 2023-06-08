
SHOW DATABASES;

CREATE DATABASE relationships;

USE relationships;

SHOW TABLES;

CREATE TABLE Patient (
  patient_id INT PRIMARY KEY,
  patient_name VARCHAR(50),
  age INT,
  gender VARCHAR(10)
);


SELECT * FROM Patient;


CREATE TABLE DiseaseSummary (
  summary_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT UNIQUE,
  diagnosis VARCHAR(100),
  treatment VARCHAR(200),
  CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);
TRUNCATE TABLE Patient;
TRUNCATE TABLE DiseaseSummary ;

DROP TABLE DiseaseSummary;
INSERT INTO Patient (patient_id, patient_name, age, gender)
VALUES
  (1, 'John Doe', 30, 'Male'),
  (2, 'Jane Smith', 25, 'Female'),
  (3, 'Michael Johnson', 45, 'Male'),
  (4, 'Emily Davis', 35, 'Female'),
  (5, 'David Wilson', 50, 'Male');


INSERT INTO DiseaseSummary (patient_id, diagnosis, treatment)
VALUES
  (1, 'Common Cold', 'Rest and fluids'),
  (4, 'Influenza', 'Antiviral medication'),
  (3, 'Hypertension', 'Lifestyle changes and medication');

SELECT * FROM DiseaseSummary;

INSERT INTO DiseaseSummary (patient_id, diagnosis, treatment)
VALUES
  (1, 'Common Cold', 'Rest and fluids');


SELECT p.patient_id, p.patient_name, d.diagnosis, d.treatment
FROM Patient p
LEFT JOIN DiseaseSummary d ON p.patient_id = d.patient_id;


SELECT *
FROM Patient
INNER JOIN DiseaseSummary ON Patient.patient_id = DiseaseSummary.patient_id;

COMMIT;
INSERT INTO DiseaseSummary (patient_id, diagnosis, treatment)
VALUES
  (5, 'Common Cold', 'Rest and fluids');

ROLLBACK;
