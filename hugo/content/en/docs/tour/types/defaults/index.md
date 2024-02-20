---
title: "Default Values"
weight: 11
---

Elements of a disjunction may be marked as preferred.
If there is only one mark, or the users constraints a field enough such that
only one mark remains, that value is the default value.

In the example, `replicas` defaults to `1`.
In the case of `protocol`, however, there are multiple definitions with
different, mutually incompatible defaults.
In that case, both `"tcp"` and `"udp"` are preferred and one must explicitly
specify either `"tcp"` or `"udp"` as if no marks were given.

{{< code-tabs >}}
{{< code-tab name="defaults.cue" language="cue" area="top-left" >}}
// any positive number, 1 is the default
replicas: uint | *1

// the default value is ambiguous
protocol: *"tcp" | "udp"
protocol: *"udp" | "tcp"
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="top-right" >}}
replicas: 1
protocol: "tcp" | "udp"
{{< /code-tab >}}
{{< /code-tabs >}}
