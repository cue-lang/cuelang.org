---
title: "Issue 3796: code-tabs inside info blocks have unwanted extra vertical spaces"
---

## Terminal

Here's a terminal. Note the vertical spacing around the command and its output - this is the expected rendering:

{{{with script "en" "1"}}}
echo hello
{{{end}}}

{{{with step}}}
Here's the same terminal inside a `step`. It renders as expected:
{{{with script "en" "2"}}}
echo hello
{{{end}}}
{{{end}}}

{{<info>}}
Here's the same terminal inside an `info` block.

It has two extra lines of vertical space versus the expected rendering:
{{{with script "en" "3"}}}
echo hello
{{{end}}}
{{</info>}}

{{{with step}}}
{{<info>}}
Here's the same terminal inside an `info` block inside a `step`.

It also has two extra lines of vertical space versus the expected rendering:
{{{with script "en" "4"}}}
echo hello
{{{end}}}
{{</info>}}
{{{end}}}

## Upload

Here's the same sequence for a file `upload`.

The expected rendering:
{{{with upload "en" "1"}}}
#force
-- file.cue --
foo: 42
{{{end}}}

{{{with step}}}
Inside a step (renders as expected):
{{{with upload "en" "2"}}}
#force
-- file.cue --
foo: 42
{{{end}}}
{{{end}}}

{{<info>}}
Inside an info block (two extra lines of vertical space):
{{{with upload "en" "3"}}}
#force
-- file.cue --
foo: 42
{{{end}}}
{{</info>}}

{{<warning>}}
Inside a warning block (two extra lines of vertical space):
{{{with upload "en" "4"}}}
#force
-- file.cue --
foo: 42
{{{end}}}
{{</warning>}}

{{<caution>}}
Inside a caution block (two extra lines of vertical space):
{{{with upload "en" "5"}}}
#force
-- file.cue --
foo: 42
{{{end}}}
{{</caution>}}

{{{with step}}}
{{<info>}}
Inside an info block inside a step (two extra lines of vertical space):
{{{with upload "en" "6"}}}
#force
-- file.cue --
foo: 42
{{{end}}}
{{</info>}}
{{{end}}}
