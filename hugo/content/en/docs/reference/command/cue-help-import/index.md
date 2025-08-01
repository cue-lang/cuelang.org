---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help import"
weight: 1000
tags:
- cue command
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgaW1wb3J0" }
$ cue help import
import converts other formats, like JSON and YAML to CUE files

Files can either be specified explicitly, or inferred from the
specified packages. Within packages, import only looks for JSON
and YAML files by default (see the "filetypes" help topic for
more info). This behavior can be overridden by specifying one of
the following modes:

   Mode       Extensions
   json       Look for JSON files (.json .jsonl .ndjson).
   yaml       Look for YAML files (.yaml .yml).
   toml       Look for TOML files (.toml).
   text       Look for text files (.txt).
   binary     Look for files with extensions specified by --ext
              and interpret them as binary.
   jsonschema Interpret JSON, YAML or CUE files as JSON Schema.
   openapi    Interpret JSON, YAML or CUE files as OpenAPI.
   auto       Look for JSON or YAML files and interpret them as
              data, JSON Schema, or OpenAPI, depending on
              existing fields.
   data       Look for JSON or YAML files and interpret them
              as data.
   proto      Convert Protocol buffer definition files and
              transitive dependencies.

Using the --ext flag in combination with a mode causes matched files to be
interpreted as the format indicated by the mode, overriding any other meaning
attributed to that extension.

auto mode

In auto mode, data files are interpreted based on some marker
fields. JSON Schema is identified by a top-level "$schema" field
with a URL of the form "https?://json-schema.org/.*schema#?".
OpenAPI is identified by the existence of a top-level field
"openapi", which must have a major semantic version of 3, and
the info.title and info.version fields.


proto mode

Proto mode converts .proto files containing Prototcol Buffer
definitions to CUE. The -I defines the path for includes. The
module root is added implicitly if it exists.

The package name for a converted file is derived from the
go_package option. It can be overridden with the -p flag.

A module root must be specified if a .proto files includes other
files within the module. Files include from outside the module
are also imported and stored within the cue.mod directory. The
import path is defined by either the go_package option or, in the
absence of this option, the googleapis.com/<proto package>
convention.

The following command imports all .proto files in all
subdirectories as well all dependencies.

   cue import proto -I ../include ./...

The module root is implicitly added as an import path.


Binary mode

Loads matched files as binary.


JSON/YAML mode

The -f option allows overwriting of existing files. This only
applies to files generated for explicitly specified files or
files contained in explicitly specified packages.

Use the -R option in addition to overwrite files generated for
transitive dependencies (files written to cue.mod/gen/...).

The -n option is a regexp used to filter file names in the
matched package directories.

The -I flag is used to specify import paths for proto mode.
The module root is implicitly added as an import if it exists.

Examples:

  # Convert individual files:
  $ cue import foo.json bar.json  # create foo.cue and bar.cue

  # Convert all json files in the indicated directories:
  $ cue import json ./...

The "flags" help topic describes how to assign values to a
specific path within a CUE namespace. Some examples of that

Examples:

  $ cat <<EOF > foo.yaml
  kind: Service
  name: booster
  EOF

  # include the parsed file as an emit value:
  $ cue import foo.yaml
  $ cat foo.cue
  {
      kind: Service
      name: booster
  }

  # include the parsed file at the root of the CUE file:
  $ cue import -f foo.yaml
  $ cat foo.cue
  kind: Service
  name: booster

  # include the import config at the mystuff path
  $ cue import -f -l '"mystuff"' foo.yaml
  $ cat foo.cue
  myStuff: {
      kind: Service
      name: booster
  }

  # append another object to the input file
  $ cat <<EOF >> foo.yaml
  ---
  kind: Deployment
  name: booster
  replicas: 1
  EOF

  # base the path values on the input
  $ cue import -f -l 'strings.ToLower(kind)' -l name foo.yaml
  $ cat foo.cue
  service: booster: {
      kind: "Service"
      name: "booster"
  }

  # base the path values on the input and file name
  $ cue import -f --with-context -l 'path.Base(filename)' -l data.kind foo.yaml
  $ cat foo.cue
  "foo.yaml": Service: {
      kind: "Service"
      name: "booster"
  }

  "foo.yaml": Deployment: {
      kind:     "Deployment"
      name:     "booster
      replicas: 1
  }

  # include all files as list elements
  $ cue import -f --list foo.yaml
  $ cat foo.cue
  [{
      kind: "Service"
      name: "booster"
  }, {
      kind:     "Deployment"
      name:     "booster
      replicas: 1
  }]

  # collate files with the same path into a list
  $ cue import -f -list -l 'strings.ToLower(kind)' foo.yaml
  $ cat foo.cue
  service: [{
      kind: "Service"
      name: "booster"
  }
  deployment: [{
      kind:     "Deployment"
      name:     "booster
      replicas: 1
  }]


Embedded data files

The --recursive or -R flag enables the parsing of fields that are string
representations of data formats themselves. A field that can be parsed is
replaced with a call encoding the data from a structured form that is placed
in a sibling field.

It is also possible to recursively hoist data formats:

Example:
  $ cat <<EOF > example.json
  "a": {
      "data": '{ "foo": 1, "bar": 2 }',
  }
  EOF

  $ cue import -R example.json
  $ cat example.cue
  import "encoding/json"

  a: {
      data: json.Encode(_data),
      _data = {
          foo: 1
          bar: 2
      }
  }

Usage:
  cue import [mode] [inputs] [flags]

Flags:
      --dry-run                  show what files would be created
      --ext stringArray          match files with these extensions
      --files                    split multiple entries into different files
  -f, --force                    force overwriting existing files
      --list                     concatenate multiple objects into a list
      --merge                    merge non-CUE files (default true)
  -n, --name string              regexp filter for non-CUE file names in directories
  -o, --outfile string           filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
  -p, --package string           package name for non-CUE files
  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
      --proto_enum string        mode for rendering enums (int|json) (default "int")
  -I, --proto_path stringArray   paths in which to search for imports
  -R, --recursive                recursively parse string values
  -d, --schema string            expression to select schema for evaluating values in non-CUE files
      --with-context             import as object with contextual data

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
