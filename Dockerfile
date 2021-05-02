FROM rust:alpine as builder

WORKDIR /app
COPY ./ /app
RUN cargo build --release

FROM alpine
COPY --from=builder /app/target/release/spudboy .
ENTRYPOINT [ "/spudboy" ]
