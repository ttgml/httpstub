FROM gcc:4.9 AS builder
COPY . /app
WORKDIR /app
RUN make

FROM ubuntu:22.04
WORKDIR /app
COPY --from=builder /app/httpstub /app/
COPY README.md /app
EXPOSE 8402
ENTRYPOINT ["./httpstub"]
CMD ["-f","README.md"]
