---
title: Quote
weight: 28
---

Next to the regular (very basic) [markdown blockquotes](/examples/basic/block#blockquotes), there is an option to use the `{{</* quote */>}}` shortcode. With this shortcode you can also add an author name and their role. But unlike the markdown blockquotes, the `quote` shortcode does not accept markdown.

## Example

```
{{</* quote author="John Doe" role="CEO Company Name" */>}}
Fames imperdiet tellus tristique et. Enim sit adipiscing risus id nec. Enim viverra massa, enim diam. Donec tellus amet lectus aliquam ut sed. In sed maecenas duis metus netussit adipiscing risus id nec. Enim viverra massa, enim diam.
{{</* /quote */>}}
```

{{< quote author="John Doe" role="CEO Company Name" >}}
Fames imperdiet tellus tristique et. Enim sit adipiscing risus id nec. Enim viverra massa, enim diam. Donec tellus amet lectus aliquam ut sed. In sed maecenas duis metus netussit adipiscing risus id nec. Enim viverra massa, enim diam.
{{< /quote >}}

## Attributes

author
: optional - Enter the name of the person the quote belongs to

role
: optional - Enter the role/function/job title/etc for the person the quote belongs to
