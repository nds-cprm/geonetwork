# Variables
GS_VERSION = 3.10.6

IMAGE_TAG = ndscprm/geonetwork:$(GS_VERSION)

CONTAINER_NAME = geonetwork-dev

auto-up: build

build:

	docker build -t $(IMAGE_TAG) -f Dockerfile .

start:

    docker container start $(CONTAINER_NAME) 

stop:

    docker container stop $(CONTAINER_NAME) 

clean: stop

    docker rm $(CONTAINER_NAME) 
	
wait:

	sleep 5

logs:

    docker logs $(CONTAINER_NAME) 

reset: stop wait start
