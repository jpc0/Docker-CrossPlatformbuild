# Docker to build cross platform apps

This is an example of how to build a C++ app on two different platforms
using docker's multi-platform images

If you haven't setup buildx yet, `mybuilder` can be any name
```
docker buildx create --name mybuilder --driver docker-container --bootstrap
```

```
docker buildx use mybuilder
```

Docker desktop doesn't seem to allow importing "manifest" yet so you need to 
build each seperately and call the seperately, you can use a different tag
and image name if you need to do both on a single host

For arm:
```
docker buildx build --platform linux/arm64 -t tutorial:latest --load
```

```
docker create --platform linux/arm64 --name tutorial tutorial
docker cp tutorial:/src/build build
```

For x86:
```
docker buildx build --platform linux/amd64 -t tutorial:latest --load
```

```
docker create --platform linux/amd64 --name Tutorial tutorial
docker cp tutorial:/src/build build
```
