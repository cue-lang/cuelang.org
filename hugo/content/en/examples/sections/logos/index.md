---
title: Logos
weight: 41
---

You can use the `{{</* logos */>}}` shortcode in combination with the `{{</* logos__item */>}}` to add a logo section to your content.

## Example

```
{{</* logos
    bgColor="white"
    title="Title of logos section"
    intro="This is the intro of the section"
    buttonText="Show me more"
    buttonUrl="/examples"
*/>}}
    {{</* logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        alt="Logo of GerritForge"
        name="GerritForge"
        lazy=false
    */>}}

    {{</* logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    */>}}
{{</* /logos */>}}
```

{{< logos
    bgColor="white"
    title="Title of logos section"
    intro="This is the intro of the section"
    buttonText="Show me more"
    buttonUrl="/examples"
>}}
    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        alt="Logo of GerritForge"
        name="GerritForge"
        lazy=false
    >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    >}}
{{< /logos >}}


## Attributes

### Logos shortcode

bgColor
: optional - Set the background color of the section

buttonText
: optional - Enter the text for the button

buttonUrl
: optional - Enter the target, i.e., url of page you want to link to

intro
: optional - Enter the introduction text of the section

title
: optional - Enter the title of the section

### Logos item shortcode

src
: required - Enter the path to the image

alt
: optional - Enter the alt title for the image (recommended for SEO)

lazy
: optional - default value is true. When this section is the first section you might want to set this value to false (recommended for first meaningfull paint). In this case set lazy to `false`

link
: optional - Enter the target, i.e., url of page you want to link to

name
: optional - Adds the name of the company to the screenreader link


## Background colors

white
: {{< logos
    bgColor="white"
>}}
    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    >}}
{{< /logos >}}

blue
: {{< logos
    bgColor="blue"
>}}
    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        lazy="false"
    >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    >}}
{{< /logos >}}

grey
: {{< logos
    bgColor="grey"
>}}
    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    >}}
{{< /logos >}}

yellow
: {{< logos
    bgColor="yellow"
>}}
    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    >}}
{{< /logos >}}
