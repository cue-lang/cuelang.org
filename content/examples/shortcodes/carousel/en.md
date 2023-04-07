---
title: Carousel
weight: 22
---

You can use the `{{</* carousel */>}}` shortcode in combination with the `{{</* carousel-slide */>}}` to add a carousel to your content.

## Examples

```
{{</* carousel */>}}
    {{</* carousel-slide src="images/moon.jpg" alt="moon" caption="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam" lazy="false" */>}}
    {{</* carousel-slide src="images/allium.jpg" alt="allium" caption="Allium" */>}}
    {{</* carousel-slide src="images/birds.jpg" alt="birds" */>}}
    {{</* carousel-slide src="images/cow.jpg" alt="cow" */>}}
{{</* /carousel */>}}
```

{{< carousel>}}
    {{< carousel-slide src="images/moon.jpg" alt="moon" caption="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam" lazy="false" >}}
    {{< carousel-slide src="images/allium.jpg" alt="allium" caption="Allium" >}}
    {{< carousel-slide src="images/birds.jpg" alt="birds" >}}
    {{< carousel-slide src="images/cow.jpg" alt="cow" >}}
{{< /carousel >}}

```
{{</* carousel items="2" height="250" unit="px" duration="7000" */>}}
    {{</* carousel-slide src="images/birds.jpg" caption="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam" */>}}
    {{</* carousel-slide src="images/moon.jpg.jpg" caption="Moon" */>}}
    {{</* carousel-slide src="images/cow.jpg" */>}}
    {{</* carousel-slide src="images/allium.jpg" */>}}
{{</* /carousel */>}}
```

{{< carousel items="2" height="250" unit="px" duration="7000" >}}
    {{< carousel-slide src="images/birds.jpg" caption="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam" >}}
    {{< carousel-slide src="images/moon.jpg" caption="Moon" >}}
    {{< carousel-slide src="images/cow.jpg" >}}
    {{< carousel-slide src="images/allium.jpg" >}}
{{< /carousel >}}

## Attributes

### Carousel shortcode

items
: optional - Set the amount of images you want to see in a slide. Default is "1"

height
: optional - Set the height of the carousel in combination with the "unit" attribute. If you want a fixed height on all screen sizes you can set the height for example to 500 and the unit to px. If you want a fixed ratio on all screen sizes you can calculate the number and set the unit to %. For example if you want a ratio of 16:9, you can do the following calculation to get the percentage: (9 / 16 \* 100) = 56.25. 3:4 would be: (4 / 3 \* 100) = 133.33. Default is "56.25"

unit
: optional - Set the unit of the height in combination with the "height" attribute. This can be either "px" or "%". Default is "%"

duration
: optional - Set the duration of the interval in milliseconds if you want to autoplay the carousel. After this time, the carousel shows the next slide.

### Carousel slide shortcode

src
: required - Enter the path to the image

caption
: optional - Shows text on the bottom of the slide

alt
: optional - Enter the alt title for the image (recommended for SEO)

lazy
: optional - When this section is the first section you might want to set this value to false (recommended for first meaningfull paint). In this case set lazy to "false". Default is "true"
