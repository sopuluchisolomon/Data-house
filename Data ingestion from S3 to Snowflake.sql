CREATE OR REPLACE STORAGE INTEGRATION inte
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED =  TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::424570854685:role/fast_api'
STORAGE_ALLOWED_LOCATIONS = ('s3://sop-buc/');

desc INTEGRATION inte

create OR REPLACE table patient_data (Patient_ID int,
Name string, 
Age int,
Diagnosis string,
Treatment string,
Files int);

select * from patient_data

CREATE OR REPLACE FILE FORMAT basic_file
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
TRIM_SPACE = TRUE
NULL_IF = ('NULL', 'null', '')
EMPTY_FIELD_AS_NULL = TRUE
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

CREATE OR REPLACE STAGE s3_sta
URL = 's3://sop-buc/health/'
STORAGE_INTEGRATION = inte
FILE_FORMAT = basic_file

COPY INTO patient_data
FROM 	@s3_sta;

select * from patient_data

