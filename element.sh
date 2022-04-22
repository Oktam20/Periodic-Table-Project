#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #WHEN ATOMIC NUMBER IS ACCESSED
  if [[ $1 =~ [0-9]+ ]]
  then
    echo "$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")" | while read B B ATOMIC_NUM B SYMBOL B NAME B MASS B MELTING B BOILING B TYPE
    do
      echo $ATOMIC_NUM $SYMBOL $NAME $MASS $MELTING $BOILING $TYPE
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi