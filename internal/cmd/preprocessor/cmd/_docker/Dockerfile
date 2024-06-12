# syntax=docker/dockerfile:1

# Code generated site_tool.cue; DO NOT EDIT.

FROM golang:1.22.3 AS build

ENV CGO_ENABLED=0

# TODO: mount the caches from the host system, having first established and
# switched to a user with the same UID and GID as the caller.

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  go install -trimpath github.com/rogpeppe/go-internal/cmd/testscript@v1.11.0

RUN mkdir /cues

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  GOBIN=/cues/v0.9.1 go install -trimpath cuelang.org/go/cmd/cue@v0.9.1

FROM golang:1.22.3

RUN apt-get update && apt-get install -y tree

RUN mkdir -p /go/bin

ENV LC_ALL=C.UTF-8

# Default to the default value of CUE. Guides can fix to a different
# version explicitly
ENV PATH="/cues/v0.9.1:${PATH}"

ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV CUELANG_CUE_LATEST="v0.9.1"
ENV CUELANG_CUE_PRERELEASE="v0.9.1"
ENV CUELANG_CUE_TIP="v0.9.1"
ENV CUELANG_CUE_DEFAULT="v0.9.1"
ENV CUELANG_CUE_PLAYGROUND="v0.9.1"

WORKDIR /

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh
RUN chmod 755 /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh

COPY --from=build /go/bin/testscript /go/bin
COPY --from=build /cues/v0.9.1/cue /cues/v0.9.1/cue

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
