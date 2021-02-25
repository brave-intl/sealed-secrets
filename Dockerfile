FROM golang:1.16 as builder

WORKDIR /src/
COPY . ./

RUN make controller-static

FROM gcr.io/distroless/static@sha256:c6d5981545ce1406d33e61434c61e9452dad93ecd8397c41e89036ef977a88f4
MAINTAINER Marko Mikulicic <mkmik@vmware.com>
COPY --from=builder /src/controller-static /usr/local/bin/controller

EXPOSE 8080
ENTRYPOINT ["controller"]
