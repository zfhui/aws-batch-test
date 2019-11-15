FROM alpine:3.10.3

MAINTAINER Zhuo-Fei Hui <zhfhui@gmail.com>

ENV FFMPEG_VERSION=4.1.4-r0

RUN apk --no-cache update && \
    apk add --update ffmpeg=${FFMPEG_VERSION}

RUN ffmpeg -version

# Create a dedicated user for running the application
RUN adduser -D the-transformer
USER the-transformer

WORKDIR /tmp/ffmpeg
COPY --chown=the-transformer sample.m4a /tmp/ffmpeg/

ENTRYPOINT ["ffmpeg", "-version"]
