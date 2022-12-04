FROM docker.io/golang:1.18-alpine
COPY main.go main.go
RUN mkdir greeter
RUN CGO_ENABLED=0 go build -ldflags '-s' -o greeter/greeter main.go
ENV GREETER_NAME=Nikhil
CMD [ "./greeter/greeter" ]