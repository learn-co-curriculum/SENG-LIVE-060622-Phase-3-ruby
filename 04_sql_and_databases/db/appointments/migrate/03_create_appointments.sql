CREATE TABLE appointments(
  id INTEGER PRIMARY KEY,
  starts_at DATETIME,
  patient_notes TEXT,
  doctor_notes TEXT,
  no_show BOOLEAN,
  receptionist_notes TEXT,
  patient_id INTEGER,
  doctor_id INTEGER
);