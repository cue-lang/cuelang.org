---
title: Bytes values
weight: 50
draft: false
---

Bytes are similar to strings, but can hold arbitrary bytes instead of just valid
Unicode. A bytes value uses single quotes instead of double quotes.  It also
supports multi-line notation and alternate escape sequences. Text is encoded as
UTF-8.

Two byte strings are equal if they hold the exact same bytes.

## Translation to JSON

JSON does not natively support binary data.
When exporting to JSON, CUE translates it to base64.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}

{{< /code-tab >}}
{{< /code-tabs >}}

## Translation to YAML

CUE translates bytes to the corresponding YAML binary type.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
{{< /code-tab >}}
{{< code-tab name="YAML" language="yaml" area="top-right" type="terminal" >}}

{{< /code-tab >}}
{{< /code-tabs >}}

## Escape sequences

Bytes defines the following escape sequences in addition to those defined for
string.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \[0-7]{3} | octal number |  | ✓ | \000 |
| \xnn | hex number |  | ✓ | \xff |

<!-- TODO: should we deprecate octal numbers? -->
