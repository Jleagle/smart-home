# syntax=docker/dockerfile:1

FROM golang:1.26-alpine AS go2rtc-builder
ARG TARGETARCH
ADD https://github.com/ucbmckee/go2rtc-ucbmckee.git#topic/reolink-baichuan /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH:-amd64} go build -ldflags '-s -w' -trimpath -o /go2rtc .

FROM ghcr.io/blakeblackshear/frigate:stable
COPY --from=go2rtc-builder --chmod=755 /go2rtc /usr/local/go2rtc/bin/go2rtc
