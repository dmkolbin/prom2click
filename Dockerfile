FROM alpine:3.11 as builder
RUN apk add --no-cache alpine-sdk go glide && \
    git clone https://github.com/dmkolbin/prom2click.git && \
    cd prom2click && \
    git checkout develop && \
    go mod download && \
    make build

FROM alpine:3.11
COPY --from=builder /prom2click/bin/prom2click /bin/prom2click
