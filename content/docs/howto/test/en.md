---
title: Test
toc_hide: true
---

`This is how an inline code block should look.`

{{{with step}}}
`This is an inline code block that renders without a contrasting background.`
This text follows as part of the same paragraph.
{{{end}}}

{{{with step}}}
`This is an inline code block that renders with a constrasting background.`
This text follows as part of the same paragraph.

For some reason this existence of this paragraph causes the background in the
previous paragraph of this step to render correctly, with a contrasting
background.
{{{end}}}

`This is how an inline code block should look.`
