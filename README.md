#### gem5-SALAM Docker Image

This repository contains a Dockerfile to generate a Docker image of
the [gem5-SALAM](https://github.com/TeCSAR-UNCC/gem5-SALAM) architecture.

The Dockerfile will install all required dependencies and create an Ubuntu 
Xenial image with a full installation of gem5-SALAM in `/gem5`.

##### Running the Dockerfile

Clone the repository:
```
git clone --recurse-submodules git@github.com:sakhmatd/gem5-SALAM-dockerfile.git
```

then run
```
docker build . -t gem5salam:latest
```

to build the image.

Once built, this command will start the image and present a shell interface:
```
docker run -ti gem5salam
```
