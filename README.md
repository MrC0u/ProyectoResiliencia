# Framework

-- En Construccion --

---
### Correr contenedor:
```
docker compose up
```
---
### Correr funciones en el contenedor de python:
```
docker exec python_container python '/funciones/Ruta_De_La_Funcion.py'
```
Para que se imprima el resultado en el log de docker:
```
docker exec python_container sh -c 'python /funciones/Ruta_De_La_Funcion.py > /proc/1/fd/1 2> /proc/1/fd/2'
```
---
### El archivo .env debe tener:
```
POSTGRES_PASSWORD=
POSTGRES_USER=
POSTGRES_DB=
HOST=
PORT=
```
---
La Metadata / Amenazas / Topologias se deben guardar en la carpeta "data" (Se pueden crear subcarpetas para organizar mejor).
Hasta ahora soporta archivos de tipo: "geojson, shp, sql  y tif".

El resto de funcionalidades se deben guardar en la caperta "funciones".
