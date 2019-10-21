#/bin/sh

if [ ! -f "$1" ]
then
  echo -e "Error: Fichier à copier n'existe pas\n\n Fichier à copier n'existe pas"
  exit 0
fi

#Cas ou output existe déjà
if [ -f "$2" ]
then
  echo -e "Error Fichier déjà existant \n\n Veuillez chhoisir un autre fichier sortant"
  exit 0
fi

bash=0
while read -r line
do
  if [[ $line = "<!--" ]]
  then
    let "bash=1"
    continue
  elif [[ $line = '-->' ]]
  then
    let "bash=0"
    continue
  fi
  
  if [[ $bash = 1 ]]
  then
    echo "$line" >> $2
  else
    echo "echo -e \"$line\"" >> $2
  fi
done < "$1"
