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

{{{with upload "en" "config"}}}
-- config.cue --
package example

configs: {
	a: 5
	b: {
		some: "value"
	}
	c: [1, 2, 3]
}
{{{end}}}

Our goal is to export each value in the map to its own YAML file, using the map
keys as filenames. We define a workflow command to iterate over the data and
write the files:

{{{with upload "en" "tool"}}}
-- workflow_tool.cue --
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
{{{end}}}

This example demonstrates a general pattern. You can adapt the configuration
structure, target filepaths, and output format (JSON, text, etc.) to suit your
specific needs.

Run the workflow command to generate the files:

{{{with script "en" "run"}}}
cue cmd write
{{{end}}}

The result is our YAML files written to disk:

{{{with upload "en" "result"}}}
#assert
-- a.yaml --
5
-- b.yaml --
some: value
-- c.yaml --
- 1
- 2
- 3
{{{end}}}

## Related content

- {{< linkto/related/howto      "use-your-first-cue-workflow-command" >}}
- {{< linkto/related/reference "command/cue-help-commands" >}}
  -- more information about CUE workflow commands
