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
  GOBIN=/cues/v0.9.0 go install -trimpath cuelang.org/go/cmd/cue@v0.9.0

FROM golang:1.22.3

RUN apt-get update && apt-get install -y tree

RUN mkdir -p /go/bin

ENV LC_ALL=C.UTF-8

# Default to the default value of CUE. Guides can fix to a different
# version explicitly
ENV PATH="/cues/v0.9.0:${PATH}"

ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
ENV CUELANG_CUE_LATEST="v0.9.0"
ENV CUELANG_CUE_PRERELEASE="v0.9.0"
ENV CUELANG_CUE_TIP="v0.9.0"
ENV CUELANG_CUE_DEFAULT="v0.9.0"
ENV CUELANG_CUE_PLAYGROUND="v0.9.0"

WORKDIR /

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh
RUN chmod 755 /usr/bin/entrypoint.sh
RUN chown root:root /usr/bin/entrypoint.sh

COPY --from=build /go/bin/testscript /go/bin
COPY --from=build /cues/v0.9.0/cue /cues/v0.9.0/cue

# We use the JDK provided by Eclipse Temurin.
# Eclipse Temurin is the most common JDK distribution,
# supported by many organizations, such as Red Hat and IBM.
#
# OpenJDK itself recommends Eclipse Temurin: https://wiki.openjdk.org/display/JDKUpdates/JDK+21u
#
# Microsoft officially supports and recommends it on Azure: https://learn.microsoft.com/en-us/azure/developer/java/fundamentals/java-support-on-azure
#
# This article also recommends Eclipse Temurin: https://whichjdk.com
RUN \
	apt-get update && apt-get install -y wget apt-transport-https software-properties-common gnupg && \
	wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
	echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
	apt-get update && \
	apt-get install -y temurin-22-jdk

RUN apt-get install -y maven

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
