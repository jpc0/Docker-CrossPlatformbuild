FROM debian:bookworm
WORKDIR /src

RUN apt update && apt upgrade -y && apt install build-essential -y
RUN apt install cmake ninja-build -y

COPY . .

RUN cmake . -B build
RUN cmake --build build
