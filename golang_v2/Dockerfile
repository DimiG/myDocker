###########################
# File Name  : Dockerfile #
# Created by : Dmitri G.  #
# Date       : 2019-07-17 #
###########################

### Build Stage ###
FROM golang:alpine AS builder

# *** Create Variables for container ***
# MYWORKDIR MUST be specified in Makefile
ARG MYWORKDIR

# Install Git
# Git is required for fetching the dependencies
RUN apk update && apk add --no-cache git

# Create Docker USER
RUN adduser -D -g '' dockeruser

# Change current USER
USER dockeruser

# Set up the WORK DIR
WORKDIR ${MYWORKDIR}

### Release Stage ###
FROM alpine AS production

# *** Create Variables for container ***
# PROGNAME MUST be specified in Makefile
ARG PROGNAME

# Import the user and group files from the builder
COPY --from=builder /etc/passwd /etc/passwd

# Copy static executable
COPY ./src/${PROGNAME} /app/goapp

# Use an unprivileged USER
# Some PaaS demands it
USER dockeruser

# Run the Binary
ENTRYPOINT ["/app/goapp"]

