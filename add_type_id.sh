#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


echo "$($PSQL "SELECT atomic_number, type FROM properties;")" | while read ID B TYPE
do
  TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type='$TYPE';")
  ALTR=$($PSQL"UPDATE properties SET type_id=$TYPE_ID WHERE atomic_number=$ID;")
done