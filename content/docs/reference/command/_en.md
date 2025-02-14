---
title: The cue command
weight: 50
toc_hide: false
---

The `cue` command is a versatile interface for working with CUE and its ecosystem.
It provides a variety of sub-commands, including tools
for [validating]({{<relref"cue-help-vet">}}),
[importing]({{<relref"cue-help-import">}}), and
[exporting]({{<relref"cue-export">}}) data and constraints;
for running
[data-driven workflows]({{<relref"cue-help-commands">}});
and for working with dependencies via
[CUE modules]({{<relref"cue-help-modules">}}) and
[module registries]({{<relref"cue-help-registryconfig">}}).

On this page you can find [the full list of sub-commands](#help-texts)
in the latest version of `cue`, and their built-in help texts.
You'll also find an incomplete-but-expanding set of guides dedicated to
[the most commonly-used sub-commands](#guides).
These guides include curated links to related content, including how-to guides,
tutorials and other relevant documentation.

<!-- H3 heading so this *doesn't* show up in the left-hand nav, which can serve as a command index. -->
### Guides

Dedicated guides for common `cue` sub-commands:

{{<cards>}}
{{< card
    href="cue-export/"
    title="The cue export command"
>}}
Use `cue export` to produce validated, concrete data for tools that need
configurations encoded in formats like JSON or YAML.
{{</card>}}
{{</cards>}}

<!-- H3 heading so this *doesn't* show up in the left-hand nav, which can serve as a command index. -->
### Help texts

The built-in help texts available in the
[latest version]({{<relref"docs/introduction/installation">}}#installing-the-cue-command)
of `cue`:
