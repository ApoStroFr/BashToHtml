#/bin/sh

if [ ! -f "$1" ]
then
  echo -e "Error: Fichier à copier n'existe pas\n\n Fichier à copier n'existe pas"
  exit 0
fi
