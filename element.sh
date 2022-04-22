#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

CHECK(){
  echo "$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $1='$2';")" | while read B B ATOMIC_NUM B SYMBOL B NAME B MASS B MELTING B BOILING B TYPE
    do
      if [[ ! -z $ATOMIC_NUM ]]
      then
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      else
        echo "I could not find that element in the database."
      fi
    done
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #WHEN ATOMIC NUMBER IS ACCESSED
  if [[ $1 =~ [0-9]+ ]]
  then
    CHECK "atomic_number" $1
  
  else
    #WHEN SYMBOL IS ACCESSED
    if [[ ${#1} -le 2 ]]
    then
      CHECK "symbol" $1
    fi

    #WHEN NAME IS ACCESSED
    if [[ ${#1} -gt 2 ]]
    then
      CHECK "name" $1
    fi
  fi
fi