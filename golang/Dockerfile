###########################
# File Name  : Dockerfile #
# Created by : Dmitri G.  #
# Date       : 2019-06-15 #
###########################
FROM golang:alpine AS builder

# Install Git
# Git is required for fetching the dependencies
RUN apk update && apk add --no-cache git

# Create appuser
RUN adduser -D -g '' appuser

WORKDIR /usr/src/myapp

USER appuser

FROM scratch AS production

# *** Create Variables for container ***
ARG TARGET_NAME="myapp"
ARG SOURCE_NAME="mytstapp"

# Import the user and group files from the builder
COPY --from=builder /etc/passwd /etc/passwd

# Copy static executable
COPY ./${SOURCE_NAME}/${TARGET_NAME} /go/bin/app

# Use an unprivileged user
USER appuser

# Run the binary
ENTRYPOINT ["/go/bin/app"]

