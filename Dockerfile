# syntax=docker/dockerfile:1.3
FROM rust:1.65.0 AS builder

ARG TARGETPLATFORM

WORKDIR /root

RUN --mount=type=cache,target=/usr/local/cargo/registry,id=${TARGETPLATFORM} cargo install cargo-strip

COPY . .

RUN --mount=type=cache,target=/usr/local/cargo/registry,id=${TARGETPLATFORM} --mount=type=cache,target=/root/target,id=${TARGETPLATFORM} \
    cargo build --release && \
    cargo strip && \
    mv /root/target/release/hello-action /root

#FROM gcr.io/distroless/cc-debian11
FROM gcr.io/distroless/static:nonroot

COPY --from=builder /root/hello-action /

ENTRYPOINT ["./hello-action"]