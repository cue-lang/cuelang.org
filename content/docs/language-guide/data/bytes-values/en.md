---
title: Bytes values
weight: 50
draft: true
---

Bytes are similar to strings, but can hold arbitrary bytes instead of just valid
Unicode. A bytes value uses single quotes instead of double quotes.  It also
supports multi-line notation and alternate escape sequences. Text is encoded as
UTF-8.

Two byte strings are equal if they hold the exact same bytes.

## Translation to JSON

JSON does not natively support binary data.
When exporting to JSON, CUE translates it to base64.

{{{with code "en" "bytes-to-json"}}}
#nofmt TODO: bug to be fixed
#norun TODO: bug to be fixed
-- in.cue --
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
-- out.json --

{{{end}}}

## Translation to YAML

CUE translates bytes to the corresponding YAML binary type.

{{{with code "en" "bytes-to-yaml"}}}
#nofmt TODO: bug to be fixed
#norun TODO: bug to be fixed
-- in.cue --
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
-- out.yaml --

{{{end}}}

## Escape sequences

Bytes defines the following escape sequences in addition to those defined for
string.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \[0-7]{3} | octal number |  | ✓ | \000 |
| \xnn | hex number |  | ✓ | \xff |

<!-- TODO: should we deprecate octal numbers? -->
