create database churn_project;

use churn_project;

show tables;

select * from telco_customers;

select * from telco_customers limit 5;

show columns from telco_customers;
DESCRIBE telco_customers;

alter table telco_customers
modify customerid varchar(64) not null,
modify country varchar(64),
modify state varchar(64),
modify city varchar(64),
modify zip_code varchar(16),
modify lat_long varchar(64),
modify latitude decimal(9,6),
modify longitude decimal(9,6),
modify gender varchar(8),
modify senior_citizen varchar(8),
modify partner varchar(8),
modify dependents varchar(8),
modify tenure_months int,
modify phone_service varchar(8),
modify multiple_lines varchar(32),
modify internet_service varchar(32),
modify online_security varchar(32),
modify online_backup varchar(32),
modify device_protection varchar(32),
modify tech_support varchar(32),
modify streaming_tv varchar(32),
modify streaming_movies varchar(32),
modify contract varchar(32),
modify paperless_billing varchar(8),
modify payment_method VARCHAR(64),
modify monthly_charges DECIMAL(10,2),
modify total_charges DECIMAL(12,2),
modify churn_label VARCHAR(8),
modify churn_value TINYINT,
modify churn_score INT,
modify cltv DECIMAL(12,2),
modify churn_reason VARCHAR(255),
modify tenure_buckets VARCHAR(16),
modify service_count INT,
modify churn_score_norm DECIMAL(6,4),
modify risk_score DECIMAL(10,6),
modify risk_band VARCHAR(16);

ALTER TABLE telco_customers DROP COLUMN monthly_cahrges;

describe telco_customers;

