CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  date_of_birth date
);

  
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at timestamp,
  status varchar(100),
  patient_id int
);

          
ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient
FOREIGN KEY (patient_id)
REFERENCES patients (id);


CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type varchar(100)
);

CREATE TABLE medical_treatment (
    id SERIAL PRIMARY KEY,
    medical_histories_id INT,
    treatments_id INT);

ALTER TABLE medical_treatment ADD CONSTRAINT fk_med_treatment_id FOREIGN KEY (treatments_id) REFERENCES treatments(id);

ALTER TABLE medical_treatment ADD CONSTRAINT fk_med_medical_id FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);
    
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int,
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories (id);
);

CREATE TABLE invoice_items(
  invoice_id int,
  treatment_id int,
  PRIMARY KEY (invoice_id,treatment_id),
  unit_price decimal,
  quantity int,
  total_price decimal,
  CONSTRAINT fk_invoice_items
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);    




CREATE INDEX medical ON medical_histories (patient_id);
CREATE INDEX invoice1 ON invoice_items (invoice_id);
CREATE INDEX invoice2 ON invoice_items (treatment_id);
CREATE INDEX medical_treatment1 ON medical_treatment (treatments_id);
CREATE INDEX medical_treatment2 ON medical_treatment (medical_histories_id);