---
title: Preprocessor features
---

The preprocessor translates the `content` directory into a `hugo` directory
that's suitable for Hugo to translate into HTML.

The preprocessor has two main forms of blocks that are rendered on the page:
the pair of cooperating
[`script` and `upload`](#script-and-upload-blocks)
blocks, and the standalone
[`code`](#code-blocks)
block. `script` and `code` blocks can be
[hidden](#hidden-scripts-and-uploads) from the reader.

## `script` and `upload` blocks

Each `script` block contains one or more commands that are executed in turn,
with their individual outputs interleaved on the rendered page.
They are displayed with a `$ ` prefix, indicating a shell context, with the
pane's copy button picking up **only** the newline-separated list of commands
(i.e. no output and no `$`-prefix). The shell context is not emulated
perfectly: filename globs do not work, for instance, but stream redirection
does.

Each `script` block is invoked with a filesystem context of the files that have
been created by all the `upload` blocks preceding the `script` block, along
with any files created, deleted, or changed by previous `script` blocks.

### Example

```
Here is the start of a CUE package:
{{{with upload "en" "file one"}}}
-- foo.cue --
package example

x: 1
{{{end}}}

Here is the package being evaluated:
{{{with script "en" "cue eval one"}}}
cue eval
{{{end}}}

Here we add to the package:
{{{with upload "en" "file two"}}}
-- bar.cue --
package example

y: 2
{{{end}}}

Here is the package being evaluated again:
{{{with script "en" "cue eval two"}}}
cue eval > foo
cat foo
{{{end}}}
```

### Rendered output

Here is the start of a CUE package:
{{{{with upload "en" "file one"}}}
-- foo.cue --
package example

x: 1
{{{{end}}}

Here is the package being evaluated:
{{{{with script "en" "cue eval one"}}}
cue eval
{{{{end}}}

Here we add to the package:
{{{{with upload "en" "file two"}}}
-- bar.cue --
package example

y: 2
{{{{end}}}

Here is the package being evaluated again:
{{{{with script "en" "cue eval two"}}}
cue eval > foo
cat foo
{{{{end}}}

## Hidden scripts and uploads

Any `script` or `upload` block can be hidden from the reader. This is useful
when performing necessary tasks such as comparing content to assert that a page
works as intended, (re-)uploading content that makes a page's narrative work
correctly, or deleting previously-uploaded files in order to reset the `script`
context for the page's next section.

To hide a block, surround its class with underscores.

### Example

```
Here is some prose, followed by a hidden upload:
{{{with _upload_ "en" "a hidden file"}}}
-- foo.txt --
bar
{{{end}}}

Here is a hidden script. Whilst it isn't visible, if any of the commands in
this script fail to return the anticipated exit code then the site build will
not succeed:
{{{with _script_ "en" "check hidden file"}}}
grep bar foo.txt
{{{end}}}

Here is some more prose.
```

### Rendered output

Here is some prose, followed by a hidden upload:
{{{{with _upload_ "en" "a hidden file"}}}
-- foo.txt --
bar
{{{{end}}}

Here is a hidden script and, whilst it isn't visible, if any of the commands in
this script fail to return the anticipated exit code then the site build will
not succeed:
{{{{with _script_ "en" "check hidden file"}}}
grep bar foo.txt
{{{{end}}}

Here is some more prose.

## `code` blocks

The contents of `script` and `upload` blocks interact with each other,
cummulatively, as a page progresses.
If you don't need this behaviour, use `code` blocks to display commands and
file content that are entirely standalone.

Commands inside `code` blocks can only interact with the files that are present
in that specific block, and cannot interact with files in other `code` blocks,
`upload` blocks, or files created by `script` blocks. The reverse is also true:
`script` blocks cannot interact with `code` blocks' content.

A `code` block's content is a txtar archive, with the files and commands/output
that it contains being placed in predefined locations in a 2x2 grid based on
the number of files that are present. File locations can be overridden with the
`#location` tag. Overlapping file locations are allowed; they stack, visually,
on the page.

There is no form of hidden `code` block.

### Example

```
Here is a standalone code example:
{{{with code "en" "a code example"}}}
#location top-left top-left top-left top-right bottom
exec wc -l file1.txt file2.txt file3.txt file4.txt
cmp stdout out
-- file1.txt --
a b c
-- file2.txt --
d
e
-- file3.txt --
1 2 3
4 5 6
7 8 9
-- file4.txt --
Some content that needs its own pane
-- out --
{{{end}}}
```

### Rendered output

Here is a standalone code example:

{{{{with code "en" "a code example"}}}
#location top-left top-left top-left top-right bottom
exec wc -l file1.txt file2.txt file3.txt file4.txt
cmp stdout out
-- file1.txt --
a b c
-- file2.txt --
d
e
-- file3.txt --
1 2 3
4 5 6
7 8 9
-- file4.txt --
Some content that needs its own pane
-- out --
 1 file1.txt
 2 file2.txt
 3 file3.txt
 1 file4.txt
 7 total
{{{{end}}}
