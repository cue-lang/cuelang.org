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
All valid JSON is valid CUE.\
The `cue` CLI reads, writes, and validates **JSON files** and JSON data,
and exports as JSON by default.
Embedded JSON can be extracted and validated.
{{< /card >}}

{{< card title="YAML" href="/docs/concept/how-cue-works-with-yaml/" label="Read more" >}}
**Read + write support**\
The `cue` CLI reads, writes, and validates **YAML files** and YAML data,
and exports as YAML on demand.
Embedded YAML can be extracted and validated.
{{< /card >}}

{{< card title="Go" href="go/" label="Learn more" >}}<!-- TODO: link to concept guide -->
**Read support**\
The `cue` CLI converts **Go types** to CUE,
enabling their use for constraining and validating data,
and export into other formats.
CUE's Go API also allows FIXME, FIXME and FIXME.
{{< /card >}}

{{< card title="OpenAPI" href="openapi/" label="Read more" >}}<!-- TODO: link to concept guide -->
**Read + write support**\
The `cue` CLI reads and writes **OpenAPI data schemas**,
directly enabling their use for constraining and validating data,
and export into other formats including CUE.
The CUE Go API does the same.
Both can read and write OpenAPI's underlying format, JSON.
{{< /card >}}

{{< card title="Protocol Buffers" href="protobuf/" label="Learn more" >}}<!-- TODO: link to concept guide -->
**Read support**\
The `cue` CLI reads **Protobuf definitions**,
including CUE constraints encoded as Protobuf options,
directly enabling their use for constraining and validating data
and export into other formats including CUE.
The CUE Go API does the same.
{{< /card >}}

{{< card title="JSON Schema" href="#" label="" >}}<!-- TODO: link to concept guide; add label-->
**Read support**\
The `cue` CLI reads **JSON Schema constraints**,
directly enabling their use for constraining and validating data
and export into other formats including CUE.
The CUE Go API does the same.
Both can read and write JSON Schema's underlying format, JSON.
{{< /card >}}

{{< /cards >}}
