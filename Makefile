pwd=$(shell pwd)
.PHONY: build deploy

build:
	docker build --no-cache -f Dockerfile -t aws-toolbox -t binxio/aws-toolbox .

buildq:
	docker build -f Dockerfile -t aws-toolbox -t binxio/aws-toolbox .

run:
	docker run -it \
		-v $(pwd)/:/workdir \
		-v $(HOME):/root \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-p "3000:3000" \
		-p "8000:8000" \
		aws-toolbox

push:
	docker push binxio/aws-toolbox