---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help trim"
weight: 1000
tags:
- cue command
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgdHJpbQ==" }
$ cue help trim
trim removes fields from structs that can be inferred from constraints

A field, struct, or list is removed if it is implied by a constraint, such
as from an optional field matching a required field, a list type value,
a comprehension or any other implied content. It will modify the files in place.


Limitations

Removal is on a best effort basis. Some caveats:
- Fields in implied content may refer to fields within the struct in which
  they are included, but are only resolved on a best-effort basis.
- Disjunctions that contain structs in implied content cannot be used to
  remove fields.
- There is currently no verification step: manual verification is required.

Examples:

	$ cat <<EOF > foo.cue
	light: [string]: {
		room:          string
		brightnessOff: *0.0 | >=0 & <=100.0
		brightnessOn:  *100.0 | >=0 & <=100.0
	}

	light: ceiling50: {
		room:          "MasterBedroom"
		brightnessOff: 0.0    // this line
		brightnessOn:  100.0  // and this line will be removed
	}
	EOF

	$ cue trim foo.cue
	$ cat foo.cue
	light: [string]: {
		room:          string
		brightnessOff: *0.0 | >=0 & <=100.0
		brightnessOn:  *100.0 | >=0 & <=100.0
	}

	light: ceiling50: {
		room: "MasterBedroom"
	}

It is guaranteed that the resulting files give the same output as before the
removal.

Usage:
  cue trim [flags]

Flags:
  -n, --dry-run          only run simulation
  -f, --force            force overwriting existing files
  -o, --outfile string   filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
