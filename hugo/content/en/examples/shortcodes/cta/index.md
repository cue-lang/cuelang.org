---
title: CTA
weight: 24
---

You can use the `{{</* cta */>}}` shortcode to add a call-to-action (CTA) to the content.

## Examples

```
{{</* cta title="Learn how CUE integrates with the JSON data-interchange format." href="/examples" label="Play Webinar" */>}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Convallis turpis tristique mauris tellus. Placerat in et elit purus varius enim dui mattis. leo et non, integer convallis tortor. Pellentesque eu vivamus laoreet varius ultricies elementum.
{{</* /cta */>}}
```

Results in:

{{< cta title="Learn how CUE integrates with the JSON data-interchange format." href="/examples" label="Play Webinar" >}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Convallis turpis tristique mauris tellus. Placerat in et elit purus varius enim dui mattis. leo et non, integer convallis tortor. Pellentesque eu vivamus laoreet varius ultricies elementum.
{{< /cta >}}

## Attributes

title
: optional - Enter the title for your CTA

href
: optional, unless you want a button, then this is required - The url of the page you want to link to

label
: optional, unless you want a button, then this is required - The text on the button
