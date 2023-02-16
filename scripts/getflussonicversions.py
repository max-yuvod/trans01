import subprocess
import json
import os
from datetime import datetime

# Obtener la fecha actual
date = datetime.now().strftime("%Y-%m-%d")

# Ejecutar el comando dpkg -l | grep flussonic y obtener la salida
output = subprocess.check_output("dpkg -l | grep flussonic", shell=True)

# Procesar la salida del comando y crear un diccionario con los datos
data = {}
for line in output.decode().split("\n"):
    if "flussonic" in line:
        package_info = line.split()
        package_name = package_info[1]
        package_version = package_info[2]
        data[package_name] = package_version

# Crear el directorio si no existe
output_dir = "/etc/flussonic/flussonicversions"
os.makedirs(output_dir, exist_ok=True)

# Guardar los datos en un archivo JSON
output_file = f"flussonic-version-{date}.json"
with open(os.path.join(output_dir, output_file), "w") as f:
    json.dump(data, f, indent=4)

~                                                                                          
~            