---
title: Ref & relref
weight: 29
---

These shortcodes will look up the pages by their relative path (e.g., blog/post.md) or their logical name (post.md) and return the permalink (ref) or relative permalink (relref) for the found page.

Read a more extensive description of `ref` and `relref` in the [Hugo cross references documentation](https://gohugo.io/content-management/cross-references/).

`ref` and `relref` take exactly one required parameter of reference, quoted and in position `0` (zero).

## Example

```
[Links example]({{</* ref "examples/basic/text/index.md#links" */>}})

[Buttons example]({{</* relref "buttons/index.md" */>}})

```

The result will be just like a link. But the difference is that with ref/relref you link to a file instead of an url.

[Links example]({{< ref "examples/basic/text/index.md#links" >}})

[Buttons example]({{< relref "buttons/index.md" >}})

Ref can also be used for anchor links:

```
[Anchor links example]({{</* ref "#anchor-header" */>}})

```

[Anchor links example]({{<ref "#anchor-header" >}})

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non felis non justo lobortis tempus ut vitae diam. Quisque ultrices nec ipsum et posuere. Vestibulum non malesuada eros, posuere luctus nulla. In hac habitasse platea dictumst. Nulla dapibus erat odio, ac dignissim quam ullamcorper in. Vivamus vitae metus justo. In hac habitasse platea dictumst. Quisque est nibh, tincidunt sed imperdiet vitae, convallis vel mauris. Nullam porttitor velit vel augue iaculis, eget molestie est ultrices. Sed metus nulla, sodales aliquam sapien at, blandit dignissim arcu.

## Anchor header

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non felis non justo lobortis tempus ut vitae diam. Quisque ultrices nec ipsum et posuere. Vestibulum non malesuada eros, posuere luctus nulla. In hac habitasse platea dictumst. Nulla dapibus erat odio, ac dignissim quam ullamcorper in. Vivamus vitae metus justo. In hac habitasse platea dictumst. Quisque est nibh, tincidunt sed imperdiet vitae, convallis vel mauris. Nullam porttitor velit vel augue iaculis, eget molestie est ultrices. Sed metus nulla, sodales aliquam sapien at, blandit dignissim arcu.

Curabitur quis consectetur lectus. Cras dictum fermentum sapien, sed sollicitudin quam volutpat a. Aenean pellentesque volutpat tincidunt. Duis vestibulum auctor risus at laoreet. Vivamus tincidunt erat et lacus suscipit, nec maximus enim efficitur. Ut auctor quis arcu in iaculis. Ut pharetra rutrum ante non aliquam. Donec nec nisi in mauris lacinia iaculis. Donec cursus mattis orci. Praesent nec ex nec ipsum hendrerit vehicula eu eu mauris. Nulla tincidunt tellus eu lacinia lobortis. Morbi sed orci tellus. Vivamus eget imperdiet magna. Vivamus dictum sit amet sapien quis sodales. Cras nec orci eget quam ornare tempus non sed nibh. Duis sed dolor dolor.

