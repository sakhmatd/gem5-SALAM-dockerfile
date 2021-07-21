# syntax=docker/dockerfile:1
FROM ubuntu:xenial

MAINTAINER Sergei Akhmatdinov <sakhmatd@darkn.space>

# Copy the repo
COPY ./gem5-SALAM /gem5/

# Copy the build script
COPY ./buildScript.sh /gem5/
WORKDIR /gem5

# Run the build script
RUN chmod +x buildScript.sh && ./buildScript.sh

# Set gem5 path
ENV M5_PATH /gem5

# Run bash by default
CMD bash
