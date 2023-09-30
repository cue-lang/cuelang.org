---
title: Info blocks
weight: 26
---

There are a couple of shortcodes you can use in order to highlight a piece of content.

## Info

In order to show an informative highlight, you can use `{{</* info */>}}`.

```
{{</* info */>}}
#### Info

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{</* /info */>}}
```

The rendered output looks like this:

{{< info >}}
#### Info

Lorem ipsum *dolor sit amet*, consectetur adipiscing elit. Phasellus tristique lectus ut bibendum tincidunt. Vestibulum posuere nisl quis bibendum fermentum.
Aenean viverra commodo erat ac porttitor. Suspendisse **a interdum leo**. Etiam volutpat lectus auctor, porttitor urna et, egestas quam. Curabitur sodales,
turpis id tristique blandit, purus orci efficitur velit, nec [molestie tortor est eget](#link) erat.
{{< /info >}}

## Warning

In order to show a warning, you can use `{{</* warning */>}}`.

```
{{</* warning */>}}
**Note:** This function is deprecated and will be removed in the future.
{{</* /warning */>}}
```

The rendered output looks like this:

{{< warning >}}
**Warning:** This function is deprecated and will be removed in the future.
{{< /warning >}}

## Caution

In order to show a destructive / dangerous information, you can use `{{</* caution */>}}`.

```
{{</* caution */>}}
**Caution:** This version in no longer supported.
{{</* /caution */>}}
```

The rendered output looks like this:

{{< caution >}}
**Caution:** This version in no longer supported.
{{< /caution >}}
