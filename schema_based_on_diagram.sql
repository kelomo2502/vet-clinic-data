-- Create a database based on a diagram
create table medical_histories(id int generated always as identity primary key,
admitted_at timestamp,
patient_id int references patients(id),
status varchar(70));

 create table patients(id int generated always as identity primary key,
 name varchar(300),
 date_of_birth date);

 create table invoices(id int generated always as identity primary key,
total_amount decimal,
generated_at timestamp,
pay_at timestamp,
medical_history_id int references medical_histories(id));

create table invoice_items(id int generated always as identity primary key,
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int references invoices(id),
treatment_id int references treatments(id));

create table treatments(id int generated always as identity primary key,
type varchar(500),
name varchar(300));

create index patient_id_index ON medical_histories(patient_id);
creaate index medical_history_index ON invoices(medical_history_id);
create index invoice_id_index ON invoice_item(invoice_id);
create index treatment_id_index ON invoice_item(treatment_id);
create index medical_histories_id_index ON medical_histories_treatment(medical_histories_id);
create index treatments_id_index ON medical_histories_treatment(treatments_id);


