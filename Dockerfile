FROM golang:1.11-stretch as build

RUN apt-get update && \
	apt-get install -y git build-essential && \
	rm -rf /var/lib/apt/lists/*

COPY ./src /app

WORKDIR /app
RUN go build main.go




FROM gcr.io/distroless/base

COPY --from=build /src/main /

CMD [ "/main" ]
