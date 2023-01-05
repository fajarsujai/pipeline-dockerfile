# syntax=docker/dockerfile:1

##
## Build
##
FROM golang AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

# RUN go build -o main .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o main 

##
## Deploy
##
FROM gcr.io/distroless/base-debian10

WORKDIR /app

COPY --from=build /app/main /app/

EXPOSE 8080

USER nonroot:nonroot

CMD ["/app/main"]