---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help fix"
weight: 1000
tags:
- cue command
---
{{<info>}}
The `--exp` flag is only available in a recent CUE
[pre-release]({{<relref"docs/introduction/installation#download-an-official-cue-binary">}}).
{{</info>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZml4" }
$ cue help fix
Fix finds CUE programs that use old syntax and old APIs and rewrites them to use newer ones.
After you update to a new CUE release, fix helps make the necessary changes
to your program.

Without any packages, fix applies to all files within a module.


Experiments

CUE experiments are features that are not yet part of the stable language but
are being tested for future inclusion. Some of these may introduce backwards
incompatible changes for which there is a cue fix. The --exp flag is used to
change a file or package to use the new, experimental semantics. Experiments
are enabled on a per-file basis.

For example, to enable the "explicitopen" experiment for all files in a package,
you would run:

	cue fix . --exp=explicitopen

For this to succeed, your current language version must support the experiment.
If an experiment has not yet been accepted for the current version, an
@experiment attribute is added in each affected file to mark the transition as
complete.

The special value --exp=all enables all experimental features that apply to the
current version.

Usage:
  cue fix [packages] [flags]

Flags:
      --exp strings   list of experiments to port
  -f, --force         rewrite even when there are errors

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
````
