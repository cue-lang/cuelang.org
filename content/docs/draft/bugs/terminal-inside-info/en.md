---
title: frontend bug - additional vertical space for code blocks inside an info block
draft: true
no_index: true
---

## Terminal

Here's a terminal. Note the vertical spacing around the command and its output, which is expected:

{{{with script "en" "1"}}}
echo hello
{{{end}}}

{{{with step}}}
Here's the same terminal inside a `step`. It looks the same as above:
{{{with script "en" "2"}}}
echo hello
{{{end}}}
{{{end}}}

{{<info>}}
Here's the same terminal inside an `info`. It gains two extra lines of vertical space:
{{{with script "en" "3"}}}
echo hello
{{{end}}}
{{</info>}}

## Upload

Here's the same sequence for a file `upload`.

Plain (as expected):
{{{with upload "en" "1"}}}
-- 1.cue --
foo: 42
{{{end}}}

{{{with step}}}
Inside a step (as expected):
{{{with upload "en" "2"}}}
-- 2.cue --
foo: 42
{{{end}}}
{{{end}}}

{{<info>}}
Inside an info block (same problem occurs):
{{{with upload "en" "3"}}}
-- 3.cue --
foo: 42
{{{end}}}
{{</info>}}

{{<warning>}}
Inside a warning block (same problem occurs):
{{{with upload "en" "4"}}}
-- 4.cue --
foo: 42
{{{end}}}
{{</warning>}}

{{<caution>}}
Inside a caution block (same problem occurs):
{{{with upload "en" "5"}}}
-- 5.cue --
foo: 42
{{{end}}}
{{</caution>}}
