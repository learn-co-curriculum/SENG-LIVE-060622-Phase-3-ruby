CREATE TABLE patients(
  id INTEGER PRIMARY KEY,
  name TEXT,
  insurance_provider TEXT,
  birthdate DATE,
  is_insured BOOLEAN,
  is_alive BOOLEAN,
  is_organ_donor BOOLEAN
);