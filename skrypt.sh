#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    -h|--help)
	  echo "Sposoby użycia skryptu:"
      echo "skrypt.sh --date   -   wyswietla dzisiejsza date"
      echo "skrypt.sh --logs   -   tworzy 100 plików o nazwach logx.txt, gdzie x to numer pliku"
	  echo "                       w każdym pliku jest jego nazwa, nazwa skryptu który go utworzył i data"
	  echo "skrypt.sh --logs N -   tworzy N plików o nazwach logx.txt, gdzie x to numer pliku"
	  echo "                       w każdym pliku jest jego nazwa, nazwa skryptu który go utworzył i data"
	  echo "skrypt.sh --help   -   pokazuje te informacje"
      exit 0
      ;;
    -d|--date)
	  shift
      date
      ;;
    -l|--logs)
	  shift
	  MAX=100
      if test $# -gt 0; then
        MAX=$1
      fi
	  shift
      DATE=`date`
	  for ((i = 1 ; i <= $MAX ; i++ )); do
	    echo log$i.txt > log$i.txt;
	    echo `basename $0` >> log$i.txt;
	    echo $DATE >> log$i.txt;
	  done
      ;;
    *)
      break
      ;;
  esac
done
