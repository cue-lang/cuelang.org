---
title: Code tabs
weight: 34
---

You can add the code-tabs/code-tab shortcode to create codeblocks with nested tabs.
A code-tab shortcode always needs to be part of a code-tabs shortcode.

## Usage

```
{{</* code-tabs */>}}

{{</* code-tab name="schema.cue" area="top-left" */>}}
#Language: {
	tag:  string
	name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{</* /code-tab */>}}

{{</* code-tab name="data.yaml" language="yaml" linenos="table" area="top-left" */>}}
languages:
  - tag: en
    name: English
  - tag: nl
    name: dutch
  - tag: no
    name: Norwegian
{{</* /code-tab */>}}

{{</* code-tab name="data.yaml" language="yaml" linenos="true" area="bottom-left" fileIcon="false */>}}
languages:
  - tag: en
    name: English
  - tag: nl
    name: dutch
  - tag: no
    name: Norwegian
{{</* /code-tab */>}}

{{</* code-tab name="TERMINAL" type="terminal" area="right" */>}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
    ./schema.cue:3:8
    ./data.yaml:5:12
{{</* /code-tab */>}}

{{</* /code-tabs */>}}
```

{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" linenos="table" area="top-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" linenos="true" area="bottom-left" fileIcon="false" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="right" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< /code-tabs >}}

{{< info >}}
A `code-tabs` shortcode can't currently be nested inside a `tabs` shortcode.
{{< /info >}}

## Attributes on code-tabs

groupId
: optional - Determine if tabs should be synced as port of a group.
If you add a groupId the selected tab will be synced across tabs with the same groupId.

height
: optional - value: number (in pixels) (omitting this attribute is same as auto height)
Determine if the tabs should have a height. By default it fits the content of the tabs.
This can be used if tabs contain long content. Example: `{{</* code-tabs height=500 */>}}`

## Attributes on code-tab

name
: required - Name of the tab

area
: required - Area the tab should be in. Can be one of 'top', 'left', 'top-left', 'top-right', 'bottom', 'bottom-left', 'right or 'bottom-right'.
Note: You can either use bottom or bottom-left/bottom-right. You can't combine 'bottom' with another bottom area. Same goes for top, left and right.
For instance if you have a tab set to 'left' it will file the entire left area and can't be combined with 'top-left' because this will break the layout.

language
: optional - Code language (for instance yaml or json)

type
: optional - Tab code type. Can be 'default' or 'terminal'. For default you can also omit this attribute

linenos
: option - Only works when a language is set. Possible values are `true`, `false`, `table`, or `inline`. Default is set to `false`. Any other value will add line numbers.

codeToCopy
: optional - By default the copy button copies the inner content. You can change that by passing in code with this attribute.
Make sure it's base64 encoded when you pass something to this attribute.
You can also set it to false to hide the copy button.

fileIcon
: optional - Showing file icon. Can be true or false. By default the value is true.

## Examples of usage of different area's

### 2 tabs in top-left (1 column)
{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}
  {{< /code-tabs >}}


### 1 tabs in top-left and 1 tab in top-right (2 colums, 1 row)
{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}
  {{< /code-tabs >}}


### 1 tab in top and 1 tab in bottom (1 column, 2 rows)
{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="bottom" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}
  {{< /code-tabs >}}

### 2 tabs in top-left, 1 in bottom-left and 1 in right

{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="bottom-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="right" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< /code-tabs >}}


### 2 tabs in top-left, 1 in top-right, 1 in bottom

{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
  {{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
  {{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="bottom" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< /code-tabs >}}


### 1 tab in left, 1 in top-right and 1 in bottom-right

{{< code-tabs >}}

{{< code-tab name="schema.cue" area="top-right" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="bottom-right" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="left" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< /code-tabs >}}

### 2 tabs in top-left, 1 in bottom-left, 1 in top-right and 1 in bottom-right with height set to 500

{{< code-tabs height=500 >}}

{{< code-tab name="schema.cue" area="top-left" >}}
#Language: {
tag:  string
name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="data.yaml" language="yaml" area="bottom-left" >}}
languages:
- tag: en
  name: English
- tag: nl
  name: dutch
- tag: no
  name: Norwegian
{{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="top-right" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12

languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12

languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12

languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12

languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< code-tab name="TERMINAL" type="terminal" area="bottom-right" >}}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
./schema.cue:3:8
./data.yaml:5:12
{{< /code-tab >}}

{{< /code-tabs >}}
