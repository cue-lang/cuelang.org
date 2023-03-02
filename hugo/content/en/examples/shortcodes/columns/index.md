---
title: Columns
weight: 23
---

If you have content you want to show side-by-side, you can use the `{{</* columns */>}}` shortcode.
For every new column, you can seperate the content via the `{{</* columns-separator */>}}` shortcode.

Note that on small screen (for example mobiles), content will be shown below each other.

## 2 columns

```
{{</* columns */>}}
#### Column 1

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{</* columns-separator */>}}
#### Column 2

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{</* /columns */>}}
```

{{< columns >}}
#### Column 1

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{< columns-separator >}}
#### Column 2

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{< /columns >}}

## 3 columns

```
{{</* columns */>}}
#### Column 1
{{</* columns-separator */>}}
#### Column 2
{{</* columns-separator */>}}
#### Column 3
{{</* /columns */>}}
```

{{< columns >}}
#### Column 1
{{< columns-separator >}}
#### Column 2
{{< columns-separator >}}
#### Column 3
{{< /columns >}}
