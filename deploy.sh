#!/bin/bash
# Compilamos la aplicacion y creamos el ejecutable en target/xxxxx.jar
./mvnw clean package

# Copiamos la carpeta deploy al servidor
scp -r -P 443 deploy crosstube@137.74.226.44:~

# Copiamos la aplicacion compilada al servidor
scp -P 443 ./target/CROSSTUBE-0.0.1-SNAPSHOT.jar crosstube@137.74.226.44:~/deploy/crosstube.jar

# Lanzamos el entorno de produccion
ssh -p 443 crosstube@137.74.226.44 "cd deploy && docker-compose down && docker-compose up --build --d"