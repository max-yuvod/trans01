#!/bin/bash
  
##########################
# Llama al primer script #
##########################
# Este realiza el backup del config file y lo deja en la ruta /etc/flussonic/flussonicdailybkp con su fecha correspondiente
echo "Corriendo getflussonicversions.py..."
python3 getflussonicversions.py


###########################
# Llama al segundo script #
###########################
# Este copia el archivo anterior al repo de github 
echo "Corriendo copyversiontogit.sh..."
./copyversiontogit.sh


##########################
# Llama al tercer script #
##########################
# Este mueve el archivo de la raiz de github a la carpeta bkp_configfiles
echo "Corriendo moveversionstofolder.sh..."
./moveversionstofolder.sh


##########################
# Llama al cuarto script #
##########################
# Este elimina el archivo si sigue estando en la raiz del repo y chequea que no haya nada que no deba estar en la raiz
echo "Corriendo gitrmversions.sh..."
./gitrmversions.sh

echo "¡Todos los scripts han sido ejecutados correctamente!"