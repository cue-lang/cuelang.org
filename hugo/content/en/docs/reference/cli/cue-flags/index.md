---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue flags"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgZmxhZ3MK" }
$ cue help flags
Non-CUE files are merged at their roots by default.
The can be combined differently or treated as different files
by using a combination of the following flags.


Individual files

To treat non-cue files as individual files, use --no-merge flag.
This is the default for vet. This flag only applies to data files
when used in combination with the --schema/-d flag.


Assigning values to a CUE path

The --path/-l flag can be used to specify a CUE path at which to
place a value. Each -l flag specifies either a CUE expression or
a CUE field (without the value following the colon), both of
which are evaluated within the value. Together, the -l flags
specify the path at increasingly deeper nesting. An expression
may refer to builtin packages as long as the name can be uniquely
identified.

The --with-context flag can be used to evaluate the label
expression within a struct of contextual data, instead of
within the value itself. This struct has the following fields:

{
	// data holds the original source data
	// (perhaps one of several records in a file).
	data: _
	// filename holds the full path to the file.
	filename: string
	// index holds the 0-based index element of the
	// record within the file. For files containing only
	// one record, this will be 0.
	index: uint & <recordCount
	// recordCount holds the total number of records
	// within the file.
	recordCount: int & >=1
}


Handling multiple documents or streams

To handle multi-document files, such as JSON Lines or YAML
files with document separators (---), the user must specify
a the --path, --list, or --files flag.
The --path flag merges each element into a single package as
if each element was defined in a separate file. The --list flag
concatenates each entry in a file into a list.
Using --list flag in combination with the --path flag
concatenates entries with the same path into a list, instead of
unifying them.
Finally, the --files option causes each entry to be written to
a different file. The -files flag may only be used in
combination with the import command.


Examples:

# Put a value at a path based on its "kind" and "name" fields.
$ cue eval -l 'strings.ToLower(kind)' -l name foo.yaml

# Include a schema under the "myschema" field using the path notation.
$ cue eval -l myschema: schema: foo.json

# Base the path values on its kind and file name.
$ cue eval --with-context -l 'path.Base(filename)' -l data.kind foo.yaml

```
