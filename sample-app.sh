#!/bin/bash

# Limpiar todo
docker stop samplerunning 2>/dev/null
docker rm samplerunning 2>/dev/null
docker rmi sampleapp 2>/dev/null
rm -rf tempdir

# Crear carpetas y copiar archivos
mkdir -p tempdir/templates
mkdir -p tempdir/static

cp sample_app.py tempdir/
cp templates/index.html tempdir/templates/
cp static/style.css tempdir/static/

# Crear Dockerfile
cat <<EOF > tempdir/Dockerfile
FROM python
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
WORKDIR /home/myapp
ENV FLASK_APP=sample_app.py
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000", "--without-threads"]
EOF

# Construir y ejecutar
cd tempdir
docker build -t sampleapp .
docker run -t -d -p 5000:5000 --name samplerunning sampleapp
docker ps -a
