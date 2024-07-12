---
title: Preprocessor features
---

The preprocessor translates the `content` directory into the `hugo` directory.
Its input is Markdown files, and its output is Markdown files that are suitable
for Hugo to translate into HTML.

The preprocessor has two main forms of blocks that are rendered on the page:
the pair of cooperating
[`script` and `upload`](#script-and-upload-blocks)
blocks, and the standalone
[`code`](#code-blocks)
block. `script` and `upload` blocks can be
[hidden](#hidden-scripts-and-uploads) from the reader.

## `script` and `upload` blocks

A `script` block contains one or more commands that are executed in turn,
with their individual outputs interleaved on the rendered page.
They are displayed with a `$ ` prefix (indicating a shell context) with the
pane's copy button picking up **only** the newline-separated list of commands
(i.e. no output and no `$`-prefix).

Each page's `script` and `upload` blocks are transformed into a single bash
script, which is invoked by the preprocessor. This means that each block
operates in the context of the filesystem (and process) state created by
the preceding `script` and `upload` blocks.

### Example

```
Here is the start of a CUE package:
{{{with upload "en" "upload initial files"}}}
-- foo.cue --
package example

x: 1
-- bar.cue --
package example

y: 2
{{{end}}}

Here is the package being evaluated:
{{{with script "en" "cue eval initial files"}}}
cue eval
{{{end}}}

Here we add to the package:
{{{with upload "en" "upload additional file"}}}
-- baz.cue --
package example

z: 3
{{{end}}}

Here is the package being evaluated again:
{{{with script "en" "cue eval all files"}}}
cue eval > result.txt
cat *.txt
{{{end}}}
```

### Rendered output

Here is the start of a CUE package:
{{< code-tabs >}}
{{< code-tab name="foo.cue" language="cue" area="top-left" >}}
package example

x: 1
{{< /code-tab >}}{{< code-tab name="bar.cue" language="cue" area="top-left" >}}
package example

y: 2
{{< /code-tab >}}{{< /code-tabs >}}

Here is the package being evaluated:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
y: 2
x: 1
```

Here we add to the package:
{{< code-tabs >}}
{{< code-tab name="baz.cue" language="cue" area="top-left" >}}
package example

z: 3
{{< /code-tab >}}{{< /code-tabs >}}

Here is the package being evaluated again:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgPnJlc3VsdC50eHQKY2F0ICoudHh0" }
$ cue eval >result.txt
$ cat *.txt
y: 2
z: 3
x: 1
```

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
Here is a hidden script and, whilst it isn't visible, if any of the commands in
this script fail to return the anticipated exit code then the site build will
not succeed:
Here is some more prose.

## `code` blocks

The contents of `script` and `upload` blocks interact with each other,
cummulatively, as a page progresses. If you don't need this behaviour, use a
`code` block to display a single command in an entirely standalone, isolated
context, where it can only access a specific set of files.

A `code` block presents the reader with zero or more files, a single command,
and the command's output. The command is shown in a shell context, with a `$ `
prefix. Unlike `script` blocks, this shell context is emulated, and lacks some
shell-like capabilities such as filename globs and stream redirection.

A command inside a `code` block can only interact with the files that are
present in that specific block, and cannot interact with files in other `code`
blocks, `upload` blocks, or files created by `script` blocks.
The reverse is also true: `script` blocks cannot interact with `code` blocks' content.

A `code` block's content is a txtar archive, with the files, command string,
and command output that it contains being displayed in predefined locations in
a 2x2 grid, based on the number of files present in the archive. File locations
can be overridden with the `#location` tag, which requires the same number of
locations as there are files (the command's output is "a file", in this
context). A location is one of `top`, `bottom`, `left`, `right`, or a
combination constrained by `{top,bottom}-{left,right}`. Completely overlapping
locations are allowed, with their files being displayed as stacked code tabs.
Partially overlapping locations are technically permitted, but render very
poorly and should not be used.

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

{{< code-tabs >}}
{{< code-tab name="file1.txt" language="txt" area="top-left" >}}
a b c
{{< /code-tab >}}
{{< code-tab name="file2.txt" language="txt" area="top-left" >}}
d
e
{{< /code-tab >}}
{{< code-tab name="file3.txt" language="txt" area="top-left" >}}
1 2 3
4 5 6
7 8 9
{{< /code-tab >}}
{{< code-tab name="file4.txt" language="txt" area="top-right" >}}
Some content that needs its own pane
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="d2MgLWwgZmlsZTEudHh0IGZpbGUyLnR4dCBmaWxlMy50eHQgZmlsZTQudHh0" >}}
$ wc -l file1.txt file2.txt file3.txt file4.txt
 1 file1.txt
 2 file2.txt
 3 file3.txt
 1 file4.txt
 7 total
{{< /code-tab >}}
{{< /code-tabs >}}
