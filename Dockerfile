FROM registry.access.redhat.com/ubi8/ubi-minimal as builder

RUN microdnf install git golang make
RUN go version
WORKDIR /tmp
RUN git clone clone --single-branch --branch v1.15.0 --depth 1 https://github.com/operator-framework/operator-sdk && \
            cd operator-sdk && go mod vendor && \
            go build -o /usr/local/bin/operator-sdk cmd/operator-sdk/main.go

