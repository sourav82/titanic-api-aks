
CREATE TABLE people (
  uuid char(36) NOT NULL,
  survived INT NOT NULL,
  "passengerClass" INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  sex VARCHAR(255) NOT NULL,
  age REAL NOT NULL,
  "siblingsOrSpousesAboard" INT NOT NULL,
  "parentsOrChildrenAboard" INT NOT NULL,
  fare REAL NOT NULL
);
