-- Create doctors

INSERT INTO doctors(name, specialty, hospital, gives_lollipop)
VALUES('Dr. Who', 'Time Travel', "St. John's Bonaventure", 1);
INSERT INTO doctors(name, specialty, hospital, gives_lollipop)
VALUES('Dr. Strange', 'Sorcery', "St. John's Bonaventure", 1);

-- Create patients

INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Cindy', 'Anthem Blue Shield', '1973-03-12', 1, 1, 1);
INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Allie', 'Kaiser Permanente', '1986-09-19', 1, 1, 1);
INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Megan', NULL, '1973-03-12', 0, 1, 1);

-- Create appointments

INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-18 11:00:00', NULL, NULL, NULL, 0, 1, 1);
INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-20 13:00:00', NULL, NULL, NULL, 0, 2, 1);
INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-18 14:30:00', NULL, NULL, NULL, 0, 3, 2);