---
title: Table
weight: 32
---

## Basic table

```
{{</* table */>}}
| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |
{{</* /table */>}}
```

```
{{</* table */>}}
| Syntax | Description |
| --- | ----------- |
| Header | Title |
| Paragraph | Text |
{{</* /table */>}}
```

Both versions result in the following table

{{< table >}}
| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |
{{< /table >}}

## Theme
The default theme for the table is white/lightblue.
You can set the theme: this will result in a different table head color.

yellow
: {{</* table theme="yellow" */>}}

{{< table theme="yellow">}}
| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |
{{< /table >}}

## Alignment in table

It is also possible to set the alignment of each column

```
{{</* table */>}}
| Syntax      | Description | Test Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |
{{</* /table */>}}
```

{{< table >}}
| Syntax      | Description | Test Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |
{{< /table >}}
