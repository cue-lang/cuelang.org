---
title: Definitions
weight: 150
---

In CUE, schemas are typically written as **definitions**.
A definition is a field whose identifier starts with `#` or `_#`.

Because CUE knows that definitions are used for validation,
they aren't output as data.
It's normal for definitions to specify fields that don't have concrete values,
such as types.

A definition also tells CUE the complete set of allowed fields,
meaning that evaluations <!-- TODO: explain "evaluation" here, or before this point? Swap with "export"? -->
will fail if any additional fields are specified.
We say that such a definition defines a  **closed** struct.
Including a `...` in a struct keeps it **open**.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Conn: {
	address:  string
	port:     int
	protocol: string

	// Uncomment this to allow any field.
	// ...
}

lossy: #Conn & {
	address:  "203.0.113.42"
	port:     8888
	protocol: "udp"

	// The timeout field is not specified in
	// #Conn, and its presence causes an
	// evaluation failure.
	timeout: 30
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
lossy.timeout: field not allowed:
    ./file.cue:1:8
    ./file.cue:10:8
    ./file.cue:18:2
{{< /code-tab >}}
{{< /code-tabs >}}
