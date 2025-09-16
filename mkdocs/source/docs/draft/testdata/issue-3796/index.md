---
title: "Issue 3796: code-tabs inside info blocks have unwanted extra vertical spaces"
---

## Terminal

Here's a terminal. Note the vertical spacing around the command and its output - this is the expected rendering:

```` { .text title="TERMINAL" data-copy="echo hello" }
$ echo hello
hello
````

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Here's the same terminal inside a `step`. It renders as expected:
```` { .text title="TERMINAL" data-copy="echo hello" }
$ echo hello
hello
````

---


{{<info>}}
Here's the same terminal inside an `info` block.

It has two extra lines of vertical space versus the expected rendering:
```` { .text title="TERMINAL" data-copy="echo hello" }
$ echo hello
hello
````
{{</info>}}

[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: {{<info>}}
Here's the same terminal inside an `info` block inside a `step`.

It also has two extra lines of vertical space versus the expected rendering:
```` { .text title="TERMINAL" data-copy="echo hello" }
$ echo hello
hello
````
{{</info>}}

---


## Upload

Here's the same sequence for a file `upload`.

The expected rendering:
```` { .cue title="file.cue" }
foo: 42
````

[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Inside a step (renders as expected):
```` { .cue title="file.cue" }
foo: 42
````

---


{{<info>}}
Inside an info block (two extra lines of vertical space):
```` { .cue title="file.cue" }
foo: 42
````
{{</info>}}

{{<warning>}}
Inside a warning block (two extra lines of vertical space):
```` { .cue title="file.cue" }
foo: 42
````
{{</warning>}}

{{<caution>}}
Inside a caution block (two extra lines of vertical space):
```` { .cue title="file.cue" }
foo: 42
````
{{</caution>}}

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: {{<info>}}
Inside an info block inside a step (two extra lines of vertical space):
```` { .cue title="file.cue" }
foo: 42
````
{{</info>}}

---

