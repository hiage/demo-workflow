FROM alpine:latest

RUN apk fix && \
    apk add --no-cache \ 
    tzdata 
    
ENV TZ=Asia/Jakarta
RUN echo "Image Staging frontend"
RUN pwd && ls -lh && date