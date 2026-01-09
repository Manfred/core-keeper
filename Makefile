all: latest

run:
	docker run -it --rm --name core-keeper -v "./DedicatedServer:/root/.config/unity3d/Pugstorm/Core Keeper/DedicatedServer" mast/core-keeper

image:
	export TAG="$$(git rev-parse --short HEAD)"; \
	docker build --platform linux/amd64 -t "mast/core-keeper:$${TAG}" .

push: image
	export TAG="$$(git rev-parse --short HEAD)"; \
	docker push "mast/core-keeper:$${TAG}"

latest: push
	export TAG="$$(git rev-parse --short HEAD)"; \
	docker tag "mast/core-keeper:$${TAG}" mast/core-keeper; \
	docker push "mast/core-keeper"
