FROM golang:1.23.3-alpine3.20 as builder
WORKDIR /go/src/github.com/kjkondratuk/thecommoncoder-oauth2
RUN pwd
COPY . .

RUN go build -o bin/app cmd/oauth_server.go

FROM alpine:3.20

COPY --from=builder /go/src/github.com/kjkondratuk/thecommoncoder-oauth2/bin/app ./

ENTRYPOINT [ "./app" ]