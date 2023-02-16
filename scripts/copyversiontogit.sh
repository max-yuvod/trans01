#!/bin/bash
  
# Obtenemos la fecha actual
date=$(date +"%Y-%m-%d")

# Ruta del archivo de configuración con la fecha actual
conf_file="/etc/flussonic/flussonicversions/flussonic-version-$date.json"

# Ruta del repositorio de Github
github_repo="git@github.com:max-yuvod/trans01.git"


# Clonamos el repositorio de Github en una carpeta temporal
git clone $github_repo /tmp/trans01

# Copiamos el archivo de configuración en la carpeta del repositorio
cp $conf_file /tmp/trans01

# Nos movemos a la carpeta del repositorio
cd /tmp/trans01

# Añadimos el archivo al repositorio de Github
git add flussonic-version-$date.json

# Realizamos un commit con un mensaje indicando la fecha y hora del backup
git commit -m "Backup de dpkg flussonic generado el $date a las $(date +"%H:%M:%S")"

# Enviamos los cambios al repositorio de Github
git push

# Borramos la carpeta temporal
rm -rf /tmp/trans01