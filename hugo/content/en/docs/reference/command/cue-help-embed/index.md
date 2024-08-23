---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help embed"
tags: ["cue command"]
aliases: ["/docs/reference/cli/cue-embed/"]
weight: 1000
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZW1iZWQ=" }
$ cue help embed
The @embed attribute can be used to load files as part of CUE evaluation.
Embedding must be enabled by a file-level @extern(embed) attribute.

Embed a single file as follows, which must exist when evaluating:

	@extern(embed)

	package foo

	a: _ @embed(file=foo.json)

Embed many files of the same type with a glob pattern,
which inserts one field per file matched:

	b: _ @embed(glob=images/*.*, type=binary)
	b: [string]: bytes

Note that "**" glob patterns are not supported at this time.

If the file extension in "file" or "glob" does not imply a file type,
it must be specified with the "type" encoding as shown above.
See the "filetypes" help topic for more.

Files containing multiple documents cannot be embedded directly.
For NDJSON or multi-document YAML files, embed as type=text
and use APIs like yaml.Extract to decode as a list.

Note that embedding cue files is not supported at this time.

Note: support for embed is experimental, and is enabled via
CUE_EXPERIMENT=embed.

For more details and discussion, see the proposal linked from
https://cuelang.org/discussion/3264.

```
