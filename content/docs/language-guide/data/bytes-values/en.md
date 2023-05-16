---
title: Bytes values
weight: 50
draft: false
---

Bytes are similar to strings, but can hold arbitrary bytes instead of just valid Unicode. A bytes value uses single quotes instead of double quotes.
It also supports multi-line notation and alternate escape sequences. Text is encoded as UTF-8.

Two byte strings are equal if they hold the exact same bytes.

## Translation to JSON

JSON does not natively support binary data.
When exporting to JSON, CUE translates it to base64.

```coq
{{{with sidebyside "en" "bytes-to-json"}}}

-- in.cue --
a: #'A newline is written as \n.'#
b: '''
	sfsf
	'''
-- out.json --
{
    "a": "QSBuZXdsaW5lIGlzIHdyaXR0ZW4gYXMgXG4u",
    "b": "c2ZzZg=="
}
{{{end}}}
```

## Translation to YAML

CUE translates bytes to the corresponding YAML binary type.

```coq
{{{with sidebyside "en" "bytes-to-yaml"}}}

-- in.cue --
a: #'A newline is written as \n.'#
b: '''
	sfsf
	'''
-- out.yaml --
a: !!binary QSBuZXdsaW5lIGlzIHdyaXR0ZW4gYXMgXG4u
b: !!binary c2ZzZg==
{{{end}}}
```

## Escape sequences

Bytes defines the following escape sequences in addition to those defined for string.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \[0-7]{3} | octal number |  | ✓ | \000 |
| \xnn | hex number |  | ✓ | \xff |

<!-- TODO: should we deprecate octal numbers? -->

