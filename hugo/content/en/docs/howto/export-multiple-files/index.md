---
title: Generate multiple files using a workflow command
toc_hide: true
authors:
- myitcv
tags:
- workflow command
---

You use [cue export]({{< relref "docs/reference/command/cue-help-export" >}})
to generate individual configuration files from your CUE definitions in a
variety of formats. But when managing larger projects or provisioning complex
systems, you often need to generate multiple files simultaneously as part of a
repeatable workflow. This guide introduces a powerful, idiomatic solution using
a [cue cmd]({{< relref "docs/reference/command/cue-help-cmd" >}}) workflow to
create, organize, and output your multiple configuration files in a single
step.

We start with a simple configuration containing a map of data:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
package example

configs: {
	a: 5
	b: {
		some: "value"
	}
	c: [1, 2, 3]
}
{{< /code-tab >}}{{< /code-tabs >}}

Our goal is to export each value in the map to its own YAML file, using the map
keys as filenames. We define a workflow command to iterate over the data and
write the files:

{{< code-tabs >}}
{{< code-tab name="workflow_tool.cue" language="cue" area="top-left" >}}
package example

import (
	"encoding/yaml"
	"tool/file"
)

command: write: {
	for k, v in configs {
		"write_\(k)": file.Create & {
			filename: "\(k).yaml"
			contents: yaml.Marshal(v)
		}
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

This example demonstrates a general pattern. You can adapt the configuration
structure, target filepaths, and output format (JSON, text, etc.) to suit your
specific needs.

Run the workflow command to generate the files:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCB3cml0ZQ==" }
$ cue cmd write
````

The result is our YAML files written to disk:

{{< code-tabs >}}
{{< code-tab name="a.yaml" language="yaml" area="top-left" >}}
5
{{< /code-tab >}}{{< code-tab name="b.yaml" language="yaml" area="top-left" >}}
some: value
{{< /code-tab >}}{{< code-tab name="c.yaml" language="yaml" area="top-left" >}}
- 1
- 2
- 3
{{< /code-tab >}}{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto      "use-your-first-cue-workflow-command" >}}
- {{< linkto/related/reference "command/cue-help-commands" >}}
  -- more information about CUE workflow commands
