CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT uuid_generate_v4();

CREATE TABLE people (
  uuid uuid DEFAULT uuid_generate_v4 (),
  survived INT NOT NULL,
  passengerclass INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  sex VARCHAR(255) NOT NULL,
  age REAL NOT NULL,
  siblingsorspousesaboard INT NOT NULL,
  parentsorchildrenaboard INT NOT NULL,
  fare REAL NOT NULL
);

copy people(survived,passengerclass,name,sex,age,siblingsorspousesaboard,parentsorchildrenaboard,fare) FROM '/tmp/titanic.csv' delimiter ',' csv HEADER;

ALTER USER postgres WITH PASSWORD 'postgres'
