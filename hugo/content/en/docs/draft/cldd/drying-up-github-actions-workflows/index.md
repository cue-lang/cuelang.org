---
title: DRYing up GitHub Actions workflows
---

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most useful features are designed to reduce repetition and allow
easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing up</dfn>
of configuration and data sources.
This guide shows you how to use those features to simplify the sources of
multiple GitHub Actions workflows -- allowing their most important, unique
elements to stand out.

To follow along with this guide the latest pre-release of the `cue` command is
required -- please [upgrade to this version](/docs/installing-cue/) if it's not
already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes made here are specific to the configurations shown
on this page -- you'll need to adapt them to suit your CUE.

## Start with several workflows defined in CUE
## Login to the Central Registry
## Initialise your local CUE module
## Tidy your local CUE module
## Check that your CUE exports cleanly
## Simplify the CUE
## Draw the rest of the owl
## Use cue trim?
## Check that your CUE still exports cleanly
## Review the changes
## Next steps
