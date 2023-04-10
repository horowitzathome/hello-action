FROM alpine:3.16.2 as builder

WORKDIR /opt

RUN apk add curl protoc musl-dev gzip git

RUN curl -sLO https://github.com/horowitzathome/hello-action/releases/latest/download/hello-action-x86_64-unknown-linux-musl.tar.gz \
  && tar -xvf hello-action-x86_64-unknown-linux-musl.tar.gz \
  && chmod +x hello-action

############# Now create the image ##############

FROM gcr.io/distroless/static:nonroot

WORKDIR /hello-action

# Copy our build
COPY --from=builder /opt/hello-action /hello-action/hello-action
# EXPOSE 8080
CMD ["/hello-action/hello-action"]