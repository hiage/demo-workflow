FROM golang:1.14-alpine as builder

RUN apk update && apk upgrade && \
    apk --no-cache --update add git make && \
    go get github.com/gorilla/mux

WORKDIR /
COPY . .
RUN go build -o main main.go
RUN rm -rf /var/cache/apk/*

FROM alpine:latest

RUN apk fix && \
    apk add --no-cache \ 
    tzdata \
    curl
    
ENV TZ=Asia/Jakarta

RUN rm -rf /var/cache/apk/*

WORKDIR /
EXPOSE 8080
COPY --from=builder /main /
CMD ["./main"]
