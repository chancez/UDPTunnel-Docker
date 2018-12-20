FROM debian:stable-slim as build

COPY ./udptunnel-1.1/ /usr/local/udptunnel-1.1/
WORKDIR /usr/local/udptunnel-1.1/

RUN apt-get -y update
RUN apt-get -y install build-essential
RUN ./configure
RUN make
RUN make install

FROM debian:stable-slim

ENTRYPOINT ["udptunnel"]
CMD ["-h"]

COPY --from=build /usr/local /usr/local
