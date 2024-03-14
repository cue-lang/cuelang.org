---
title: Integrations
weight: 25
toc_hide: false
index_hide: true
---

CUE integrates with a growing range of formats and ecosystems

{{< cards >}}

{{< card title="JSON" href="/docs/concept/how-cue-works-with-json/" label="Learn more" >}}
**Read + write support**\
All valid JSON is also valid CUE.
The `cue` CLI reads and writes JSON files,
and exports as JSON by default.
Embedded JSON can be extracted and validated.
{{< /card >}}

{{< card title="YAML" href="/docs/concept/how-cue-works-with-yaml/" label="Read more" >}}
**Read + write support**\
The `cue` CLI reads and writes YAML files,
and exports as YAML on demand.
Embedded YAML can be extracted and validated.
{{< /card >}}

{{< card title="Go" href="go/" label="Learn more" >}}<!-- TODO: link to concept guide -->
**Read support**\
The `cue` CLI converts Go types to CUE.
CUE's Go API also allows FIXME, FIXME and FIXME.
{{< /card >}}

{{< card title="OpenAPI" href="openapi/" label="Read more" >}}<!-- TODO: link to concept guide -->
**Read + write support**\
The `cue` CLI reads and writes OpenAPI data schemas,
as does the CUE Go API.
Both can read and write OpenAPI's underlying format, JSON.
{{< /card >}}

{{< card title="Protocol Buffers" href="protobuf/" label="Learn more" >}}<!-- TODO: link to concept guide -->
**Read support**\
The `cue` CLI converts Protobuf definitions types to CUE,
including CUE constraints encoded as Protobuf options.
The CUE Go API does the same.
{{< /card >}}

{{< card title="JSON Schema" href="#" label="" >}}<!-- TODO: link to concept guide; add label-->
**Read support**\
The `cue` CLI reads JSON Schema constraints,
as does the CUE Go API.
Both can read and write JSON Schema's underlying format, JSON.
{{< /card >}}

{{< /cards >}}
