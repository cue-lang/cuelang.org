---
title: Block elements
weight: 12
---

## Lists

You can organize items into ordered and unordered lists.

### Ordered Lists

To create an ordered list, add line items with numbers followed by periods. The numbers don’t have to be in numerical order,
but the list should start with the number one.

{{< columns >}}
```
1. First item
2. Second item
3. Third item
4. Fourth item
```
{{< columns-separator >}}
1. First item
2. Second item
3. Third item
4. Fourth item
{{< /columns >}}

{{< columns >}}
```
1. First item
1. Second item
1. Third item
1. Fourth item
```
{{< columns-separator >}}
1. First item
1. Second item
1. Third item
1. Fourth item
{{< /columns >}}

{{< columns >}}
```
1. First item
2. Second item
3. Third item
    1. Indented item
    2. Indented item
4. Fourth item
```
{{< columns-separator >}}
1. First item
2. Second item
3. Third item
    1. Indented item
    2. Indented item
4. Fourth item
{{< /columns >}}


### Unordered Lists

To create an unordered list, add dashes (-), asterisks (*), or plus signs (+) in front of line items. Indent one or more items to create a nested list.

{{< columns >}}
```
- First item
- Second item
- Third item
- Fourth item
```
{{< columns-separator >}}
- First item
- Second item
- Third item
- Fourth item
{{< /columns >}}

{{< columns >}}
```
* First item
* Second item
* Third item
* Fourth item
```
{{< columns-separator >}}
* First item
* Second item
* Third item
* Fourth item
{{< /columns >}}

{{< columns >}}
```
+ First item
+ Second item
+ Third item
+ Fourth item
```
{{< columns-separator >}}
+ First item
+ Second item
+ Third item
+ Fourth item
{{< /columns >}}

{{< columns >}}
```
- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item
```
{{< columns-separator >}}
- First item
- Second item
- Third item
    - Indented item
    - Indented item
- Fourth item
{{< /columns >}}

### Unordered lists - Best practices

Markdown applications don’t agree on how to handle different delimiters in the same list. For compatibility, don’t mix and match delimiters in the same list — pick one and stick with it.

If you need to start an unordered list item with a number followed by a period, you can use a backslash (`\`) to escape the period.

{{< columns >}}
```
- 1968\. A great year!
- I think 1969 was second best.
```
{{< columns-separator >}}
- 1968\. A great year!
- I think 1969 was second best.
{{< /columns >}}

---

## Definition Lists

To create a definition list, type the term on the first line. On the next line, type a colon followed by a space and the definition.

```
First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.
```

The HTML looks like this:
```
<dl>
  <dt>First Term</dt>
  <dd>This is the definition of the first term.</dd>
  <dt>Second Term</dt>
  <dd>This is one definition of the second term. </dd>
  <dd>This is another definition of the second term.</dd>
</dl>
```
The rendered output looks like this:

First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.

---

## Horizontal Rules

To create a horizontal rule, use three or more asterisks (***), dashes (---), or underscores (___) on a line by themselves.

```
***
---
___
```

The rendered output of all three looks identical.

### Horizontal Rules - Best practices

You should also put blank lines before and after a horizontal rule for readability.


```
Try to put a blank line before...

---

...and after a horizontal rule.
```

---

## Blockquotes

To create a blockquote, add a > in front of a paragraph.

```
> Dorothy followed her through many of the beautiful rooms in her castle.
```

> Dorothy followed her through many of the beautiful rooms in her castle.

Blockquotes can contain other Markdown formatted elements. Not all elements can be used — you’ll need to experiment to see which ones work.

```
> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>  *Everything* is going according to **plan**.
```

> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>  *Everything* is going according to **plan**.

Check out the [quote shortcode](/examples/shortcodes/quote) for a more advanced quote component.

### Blockquotes - Best practices

```
Try to put a blank line before...

> This is a blockquote

...and after a blockquote.
```

## Code Blocks
Example for Code Blocks have moved to a separate page: [/examples/basic/code-block](/examples/basic/code-block)
