---
title: Ensuring that an integer value is either odd or even
tags:
- commented cue
authors:
- noamdolovich
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to validate that a given number is either odd or even.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#even: num={2 * (__div(num, 2))}
#odd:  num={2*(__div(num, 2)) + 1}

a: 56 & #even
b: 97 & #even
c: 56 & #odd
d: 97 & #odd
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgZmlsZS5jdWU=" >}}
$ cue eval -i file.cue
#even: 2 * div(num, 2)
#odd:  2*div(num, 2) + 1
a:     56
b:     _|_ // b: conflicting values 96 and 97
c:     _|_ // c: conflicting values 57 and 56
d:     97
{{< /code-tab >}}
{{< /code-tabs >}}