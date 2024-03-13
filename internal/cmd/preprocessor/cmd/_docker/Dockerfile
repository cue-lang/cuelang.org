# syntax=docker/dockerfile:1

# Code generated site_tool.cue; DO NOT EDIT.

FROM golang:1.22.1 AS build

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
  GOBIN=/cues/latest go install -trimpath cuelang.org/go/cmd/cue@v0.7.1

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  GOBIN=/cues/prerelease go install -trimpath cuelang.org/go/cmd/cue@v0.8.0-rc.1

RUN \
  --mount=type=cache,target=/cache/gocache \
  --mount=type=cache,target=/cache/gomodcache \
  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
  GOBIN=/cues/tip go install -trimpath cuelang.org/go/cmd/cue@v0.8.0-rc.1

FROM golang:1.22.1

RUN mkdir -p /go/bin

# TODO: move away from defaulting to the pre-release of CUE
ENV PATH="/cues/prerelease:${PATH}"

ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV CUELANG_CUE_LATEST="v0.7.1"
ENV CUELANG_CUE_PRERELEASE="v0.8.0-rc.1"
ENV CUELANG_CUE_TIP="v0.8.0-rc.1"

WORKDIR /

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh
RUN chmod 755 /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh

COPY --from=build /go/bin/testscript /go/bin
COPY --from=build /cues/latest/cue /cues/latest/cue
COPY --from=build /cues/prerelease/cue /cues/prerelease/cue
COPY --from=build /cues/tip/cue /cues/tip/cue

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
