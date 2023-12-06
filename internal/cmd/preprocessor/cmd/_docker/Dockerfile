# syntax=docker/dockerfile:1

# Code generated site_tool.cue; DO NOT EDIT.

FROM golang:1.21.1 AS build

ENV CGO_ENABLED=0

# TODO: mount the caches from the host system, having first established and
# switched to a user with the same UID and GID as the caller.

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  go install -trimpath github.com/rogpeppe/go-internal/cmd/testscript@v1.10.0

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  go install -trimpath cuelang.org/go/cmd/cue@v0.7.0

FROM golang:1.21.1

RUN mkdir -p /go/bin

ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV CUE_VERSION="v0.7.0"

WORKDIR /

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh
RUN chmod 755 /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh

COPY --from=build /go/bin/testscript /go/bin
COPY --from=build /go/bin/cue /go/bin

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
