#!/bin/bash

if [ -z "$1" ]; then
    echo "Error - Falta el parametro: <ID>"
    echo "[Ejemplo: gdrive-download <id>]"
    exit 1
fi

FILE_ID="$1"

CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=${FILE_ID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')
DOWNLOAD_URL=$(wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" --max-redirect=0 2>&1 | grep "Location" | cut -d " " -f 2)
FILENAME=$(basename "$DOWNLOAD_URL")

wget --load-cookies /tmp/cookies.txt -O "$FILENAME" "$DOWNLOAD_URL"
rm -f /tmp/cookies.txt

echo "Archivo guardado en: $(pwd)/$FILENAME"
