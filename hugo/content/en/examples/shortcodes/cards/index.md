---
title: Cards
weight: 22
---

You can use the `{{</* cards */>}}` shortcode in combination with the `{{</* card */>}}` to add cards to your content. Only add "normal" text to the card. Links will not work since the card itself already links to a page.

## Examples

```
{{</* cards */>}}
{{</* card href="/docs/introduction/" label="Introduction" title="A great place to start" */>}}
The Introduction is a quick trip through what's possible with CUE, suitable for newcomers to the language.
{{</* /card */>}}

{{</* card href="/docs/language-guide/" label="Language Guide" title="A deep dive into CUE" */>}}
Learning the different aspects of CUE: data, templating, schemas, queries, policy, file organization, and interoperability with other languages/encodings.
{{</* /card */>}}

{{</* card href="/docs/integrations/" label="Integrations" title="JSON, YAML, Go, Kubernetes, and more" */>}}
Learn how CUE integrates with a wide ecosystem of formats and tools.
{{</* /card */>}}

{{</* card href="/docs/tutorial/" label="Tutorials" title="Learn about CUE techniques and tools." */>}}
The Tutorials section demonstrates different language and tooling features through self-contained lessons, broken down into steps you can safely perform on your own computer.
{{</* /card */>}}

{{</* card href="/docs/howto/" label="How-to Guides" title="Directions to achieve specific goals." */>}}
Each of the How-to Guides contains practical steps for completing a task with CUE.
{{</* /card */>}}
{{</* /cards */>}}
```

{{< cards >}}
{{< card href="/docs/introduction/" label="Introduction" title="A great place to start" >}}
The Introduction is a quick trip through what's possible with CUE, suitable for newcomers to the language.
{{< /card >}}

{{< card href="/docs/language-guide/" label="Language Guide" title="A deep dive into CUE" >}}
Learning the different aspects of CUE: data, templating, schemas, queries, policy, file organization, and interoperability with other languages/encodings.
{{< /card >}}

{{< card href="/docs/integrations/" label="Integrations" title="JSON, YAML, Go, Kubernetes, and more" >}}
Learn how CUE integrates with a wide ecosystem of formats and tools.
{{< /card >}}

{{< card href="/docs/tutorial/" label="Tutorials" title="Learn about CUE techniques and tools." >}}
The Tutorials section demonstrates different language and tooling features through self-contained lessons, broken down into steps you can safely perform on your own computer.
{{< /card >}}

{{< card href="/docs/howto/" label="How-to Guides" title="Directions to achieve specific goals." >}}
Each of the How-to Guides contains practical steps for completing a task with CUE.
{{< /card >}}
{{< /cards >}}


## Attributes

href
: optional - makes it possible to link to another page or location on the page.

label
: optional/required - text for the button. If there is no href, there is no need to add a label. When there is a href, it is highly recommended to add a label.

title
: optional - adds a title to the card.
