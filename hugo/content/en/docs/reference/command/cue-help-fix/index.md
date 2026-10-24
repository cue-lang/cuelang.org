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

Without any packages, fix applies to every file of the module, from
whichever directory it is run: the files of the module's own tree, the
packages ./... denotes from the module root and _ and testdata
directories included, and every CUE file under cue.mod/gen, cue.mod/pkg
and cue.mod/usr, found by walking the module and rewritten one package at
a time without loading, so a package whose import cannot be resolved is
rewritten all the same. Symbolic links are handled as cue mod upgrade
handles them. A file the parser rejects at the module's language version
is skipped and reported. With packages named, the loader selects the
files, and its errors are reported.

A file that cannot be rewritten stops fix from writing anything, unless
-f is given, in which case the files that converted are written; either
way the errors are printed and the exit status is non-zero.


Experiments

CUE experiments are features that are not yet part of the stable language but
are being tested for future inclusion. Some of these may introduce backwards
incompatible changes for which there is a cue fix. The --exp flag is used to
change a file or package to use the new, experimental semantics. Experiments
are enabled on a per-file basis.

For example, to enable the "explicitopen" experiment for all files in a
package whose module is on a language version before v0.18.0, which is where
that experiment became stable, you would run:

	cue fix . --exp=explicitopen

For this to succeed, your current language version must support the experiment.
If an experiment has not yet been accepted for the current version, an
@experiment attribute is added in each affected file to mark the transition as
complete. An experiment which is already stable for that version needs no
fix, as files use it without an attribute, and asking for one is an error.

The special value --exp=all enables all experimental features that apply to the
current version.

Usage:
  cue fix [flags] [packages]

Flags:
      --exp strings                       list of experiments to port
  -f, --force[=true|false]                rewrite even when there are errors
      --language-version string           fallback language version for input outside a module (for example, v0.17.0)
      --remove-list-commas[=true|false]   remove commas from multiline list elements (v0.17.0+)
  -s, --simplify[=true|false]             simplify output

Global Flags:
  -E, --all-errors[=true|false]   print all available errors
  -C, --chdir string              change working directory before running command (must be the first flag)
  -i, --ignore[=true|false]       proceed in the presence of errors
````

