---
title: Test
toc_hide: true
---

`This is how an inline code block should look`

{{{with step}}}
`This is an inline code block that renders without a contrasting background.`
This text follows, but is part of the same paragraph.
{{{end}}}

{{{with step}}}
`This is an inline code block that renders with a constrasting background.`

For some reason this existence of this following paragraph causes the background to render correctly.
{{{end}}}

`this is how an inline code block should look`
