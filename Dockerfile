FROM docker.io/golang:1.18-alpine
WORKDIR /greeter
COPY . .
RUN CGO_ENABLED=0 go build -ldflags '-s' -o greeter main.go
ENV GREETER_NAME=Nikhil
EXPOSE 8080
ENTRYPOINT [ "/greeter/greeter" ] 