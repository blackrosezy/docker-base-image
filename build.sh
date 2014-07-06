docker build -t morz/generic-base-tmp .
ID=$(docker run -d morz/generic-base-tmp /bin/bash)
echo 'Flattening container...'
docker export $ID | docker import - morz/generic-base 
echo 'Done!'
