#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo "$($PSQL "SELECT symbol,atomic_number FROM elements")" | while read ELM B ATM
do
  UPP=${ELM^}
  ALTR=$($PSQL "UPDATE elements SET symbol='$UPP' WHERE atomic_number=$ATM")
done