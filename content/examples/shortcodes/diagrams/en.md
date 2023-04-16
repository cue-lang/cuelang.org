---
title: Diagrams
weight: 25
---

There is built in support for multiple types of diagrams.

## GoAT

Hugo supports [GoAT](https://github.com/bep/goat) natively. This means that this code block:
```
\```goat
      .               .                .               .--- 1          .-- 1     / 1
     / \              |                |           .---+            .-+         +
    /   \         .---+---.         .--+--.        |   '--- 2      |   '-- 2   / \ 2
   +     +        |       |        |       |    ---+            ---+          +
  / \   / \     .-+-.   .-+-.     .+.     .+.      |   .--- 3      |   .-- 3   \ / 3
 /   \ /   \    |   |   |   |    |   |   |   |     '---+            '-+         +
 1   2 3   4    1   2   3   4    1   2   3   4         '--- 4          '-- 4     \ 4

\```
```

Will be rendered as:

```goat
      .               .                .               .--- 1          .-- 1     / 1
     / \              |                |           .---+            .-+         +
    /   \         .---+---.         .--+--.        |   '--- 2      |   '-- 2   / \ 2
   +     +        |       |        |       |    ---+            ---+          +
  / \   / \     .-+-.   .-+-.     .+.     .+.      |   .--- 3      |   .-- 3   \ / 3
 /   \ /   \    |   |   |   |    |   |   |   |     '---+            '-+         +
 1   2 3   4    1   2   3   4    1   2   3   4         '--- 4          '-- 4     \ 4

```

See more:
- https://gohugo.io/content-management/diagrams/
- https://github.com/bep/goat


## Mermaid

You can also render more complex diagrams using [mermaid](https://mermaid.js.org/#/).

```
{{</* mermaid caption="And you can add a caption" */>}}
flowchart TD
    Start --> Working
    Working --> Stop
{{</* /mermaid */>}}
```

{{< mermaid caption="And you can add a caption" >}}
flowchart TD
    Start --> Working
    Working --> Stop
{{< /mermaid >}}

```
{{</* mermaid caption="And you can add a caption" */>}}
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
    Alice-)John: See you later!
{{</* /mermaid */>}}
```

{{< mermaid caption="And you can add a caption" >}}
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
    Alice-)John: See you later!
{{< /mermaid >}}
