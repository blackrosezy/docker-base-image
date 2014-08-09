docker build -t morz/generic-base-tmp .

if [ "$(docker images | grep 'generic-base-tmp')" ]; then
	echo ' => Flattening container...'
	ID=$(docker run -d morz/generic-base-tmp /bin/bash)
	docker export $ID | docker import - morz/generic-base 
	
	echo ' => Removing tmp container...'
	docker rm $ID
	
	echo ' => Removing tmp image...'
	docker rmi $(docker images | grep 'morz/generic-base-tmp' | awk '{print $3}')

	echo ' => Done!'
else
	echo ' => Failed! Cannot find morz/generic-base-tmp'
fi


