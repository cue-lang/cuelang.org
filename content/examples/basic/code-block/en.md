---
title: Code Blocks
weight: 13
---

To create code blocks, indent every line of the block by at least four spaces or one tab.

Optionally you can also use Fenced Code Blocks, you’ll use three backticks (```) or three tildes (~~~) on the lines before and after the code block.
This way you don’t have to indent any lines!

{{< columns >}}
````
```
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
````
{{< columns-separator >}}
```
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
{{< /columns >}}

## Syntax Highlighting

You can also use syntax highlighting with Fenced Code Blocks. For this you only have to add the language after the backticks.

{{< columns >}}
````
```json
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
````
{{< columns-separator >}}
```json
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
{{< /columns >}}

[Here](https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages) is a list of all the languages that can get syntax styling.

You can even mark/highlight part of the code by adding `hl_lines` with the according lines you want to highlight:

{{< columns >}}
````
```json {title="JSON", hl_lines=["2-3", 6], linenos=true}
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25,
    "residence": "Amsterdam",
    "occupation": "Developer
}
```
````
{{< columns-separator >}}
```json {title="JSON", hl_lines=["2-3", 6], linenos=true}
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25,
    "residence": "Amsterdam",
    "occupation": "Developer"
}
```
{{< /columns >}}

Other options that can be added after defining a language can be found [here](https://gohugo.io/content-management/syntax-highlighting/#highlight-shortcode).

## Attributes

We've added some custom attributes on the code fence block.

title
: optional - Title of the codeblock.

type
: optional - Editor type Can be 'default' or 'terminal'. For default you can also omit this attribute

codeToCopy
: optional - By default the copy button copies the inner content. You can change that by passing in code with this attribute.
Make sure it's base64 encoded when you pass something to this attribute.
You can also set it to false to hide the copy button.

{{< columns >}}
```` { codeToCopy=false }
```json {title="JSON" codeToCopy=false
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
````
{{< columns-separator >}}
```json {title="JSON" codeToCopy=false }
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```
{{< /columns >}}


{{< columns >}}
````
```json {title="TERMINAL" type="terminal"}
$ cue vet schema.cue  data.yaml
languages.1.name: invalid value “dutch” (does not compute or something)
     ./schema.cue:3:8
     ./data.yaml:5:12
```
````
{{< columns-separator >}}
``` {title="TERMINAL" type="terminal"}
$ cue vet schema.cue  data.yaml
languages.1.name: invalid value “dutch” (does not compute or something)
     ./schema.cue:3:8
     ./data.yaml:5:12
```
{{< /columns >}}

## Single Column

The above examples are created by using the `columns` and `columns-separator` [shortcode]({{< ref "examples/shortcodes/columns/index.md" >}}). Of course it is also possible to have a code example that is page-wide.

````
```bash
brew install cue-lang/tap/cue
```
````

```bash
brew install cue-lang/tap/cue
```

With title

````
```vshell {title="V shell"}
brew install cue-lang/tap/cue
```
````

```vshell {title="V shell"}
brew install cue-lang/tap/cue
```
