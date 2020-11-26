FROM alpine:3.11 as builder
RUN apk add --no-cache alpine-sdk go glide && \
    git clone https://github.com/dmkolbin/prom2click.git && \
    cd prom2click && \
    mkdir -p /root/go /root/go/src && \
    make get-deps && \
    cp -r /prom2click/vendor/* /root/go/src && \
    make build

FROM alpine:3.11
COPY --from=builder /prom2click/bin/prom2click /bin/prom2click
