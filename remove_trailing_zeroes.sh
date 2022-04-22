#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
ALT=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL;")

echo "$($PSQL "SELECT atomic_mass::REAL,atomic_number FROM properties;")" | while read ATM B ID
do
  echo $ATM
  ALTR=$($PSQL "UPDATE properties SET atomic_mass=$ATM WHERE atomic_number=$ID;")
done