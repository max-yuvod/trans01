#!/bin/bash
  
#Obtiene la fecha actual en formato AAAA-MM-DD
fecha=$(date +%F)

#Ruta del archivo de configuración backupeado anteriormente por el dailybkp.sh
ruta_archivo="/etc/flussonic/flussonicversions/flussonic-version-$fecha.json"

#Verificar si el archivo existe
if [ -f "$ruta_archivo" ]; then
  #Clona el repositorio en un directorio temporal
  temp_dir=$(mktemp -d)
  git clone git@github.com:max-yuvod/trans01.git "$temp_dir"

  #Mueve el archivo a la carpeta bkp del repo
  cp "$ruta_archivo" "$temp_dir/bkp_versionbydate/"
  rm "$temp_dir/flussonic-version-$fecha.json"
  rm "flussonic-version-$fecha.json"
  cd "$temp_dir"
  git add bkp_versionbydate/
  git commit -m "Agregado archivo de configuración flussonic-version-$date.json"
  git push

  #Elimina el directorio temporal
  cd -
  rm -rf "$temp_dir"
  echo "Archivo movido exitosamente"
else
  echo "El archivo flussonic-version-$fecha.json no existe"
fi
